import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);
const router = new Router({mode: 'history', base: '/', routes: [
		{path: '/', name: 'HomePage', component: () => import(/* webpackChunkName: "HomePage" */ '../pages/Home.vue')},
		{path: '/posts', name: 'PostsPage', component: () => import(/* webpackChunkName: "PostsPage" */ '../pages/Posts.vue')},
		{path: '/posts/:id', name: 'PostPage', component: () => import(/* webpackChunkName: "PostPage" */ '../pages/Post.vue')},
		{path: '/map', name: 'MapPage', component: () => import(/* webpackChunkName: "MapPage" */ '../pages/Map.vue')},
		{path: '/contacts', name: 'ContactsPage', component: () => import(/* webpackChunkName: "ContactsPage" */ '../pages/Contacts.vue')},
		{path: '/graphs', name: 'GraphsPage', component: () => import(/* webpackChunkName: "GraphsPage" */ '../pages/Graphs.vue')},
	]
});
export default router;
