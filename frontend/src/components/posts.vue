<template>
  <div>
    <div class="row alerts">
      <div v-if=alerts.success class="row"><div class="col-sm-12"><div class="alert success">{{alerts.success}}</div></div></div>
      <div v-if=alerts.error class="row"><div class="col-sm-12"><div class="alert errorr">{{alerts.error}}</div></div></div>
    </div>

    <div class="row content posts">
			<div class="row header">
				<div class="col-sm-12">
					<ul v-for="category in categories">
						<li class="float-left no-bullet width-150"><a :href="loading ? 'javascript:;' : category.url">{{category.title}}</a></li>
					</ul>
				</div>
			</div>
			<div class="row body">
				<div class="col-sm-4" v-for="post in posts">
					<div class="row thumbnail">
						<div class="col-sm-12">
							<a :href="loading ? 'javascript:;' : 'posts/' + post.uri" ><img :alt=post.title :src=post.img></a>
						</div>
					</div>
					<div class="row rating">
						<div class="col-sm-12">
							<ul v-for="i in post.rating">
								<li class="float-left no-bullet width-50"><img alt="star" src="ui/img/star.png"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row footer pager" v-if="total_page_cnt">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-3">
								<a href="javascript:;"><-</a>
						</div>
						<div class="col-sm-6">
							<div class="row">
								<div class="col-sm-4">
									<a href="javascript:;">1</a>
								</div>
								<div class="col-sm-4 txt-center">
									<a href="javascript:;">2</a>
								</div>
								<div class="col-sm-4 txt-right">
									<a href="javascript:;">3</a>
								</div>
							</div>
						</div>
						<div class="col-sm-3 txt-right">
							<a href="javascript:;">-></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
    </div>
  </div>
</template>
<script>
	export default {
		data() {
			return {loading: true, alerts: {success: '', error: ''},
				posts: [], categories: [], total_page_cnt: 0}
		},
		created() {
			this.getPosts();
		},
		methods: {
			getPosts: function () {
				this.clearAlerts();
				this.loading = true;
				this.total_page_cnt = 2;
				this.categories = [
					{uri: 'cat-1', img: '', title: 'cat 1', rating: 5},
					{uri: 'cat-2', img: '', title: 'cat 2', rating: 2}
				];
				this.$http.get('posts').then(function (response) {
					this.posts = response.data.data;
					this.loading = false;
				}, function () {
					this.showError(response.data.error)
				});
			},
			clearAlerts: function () {
				this.alerts.success = '', this.alerts.error = ''
			},
			showSuccess: function (success = "Saved!") {
				this.alerts.success = this.getTranslatedMessage(success);
				this.loading = false
			},
			showError: function (error = "Sorry, but there's a problem.") {
				this.alerts.error = this.getTranslatedMessage(error);
				this.loading = false
			},
			getTranslatedMessage: function (messageKey) {
				return this.doesTranslationExist(messageKey) ? window.translations[messageKey] : messageKey
			},
			doesTranslationExist(messageKey) {
				return messageKey && typeof window.translations[messageKey] != "undefined" && window.translations[messageKey] != null
			}
		}
	}
</script>