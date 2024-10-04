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
