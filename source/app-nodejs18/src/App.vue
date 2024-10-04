<script setup>
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue'
</script>

<template>
  <div>
    <h1>{{ title }}</h1>
    <p>La API está en: {{ apiUrl }}</p>
    <p v-if="featureFlag">¡La funcionalidad está activada!</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: process.env.VUE_APP_TITLE,
      apiUrl: process.env.VUE_APP_API_URL,
      featureFlag: process.env.VUE_APP_FEATURE_FLAG === 'true',
    };
  },
};
</script>


<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
