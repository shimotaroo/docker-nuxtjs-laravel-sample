<template>
  <!-- <Tutorial/> -->
  <div>
    {{ sample}}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data () {
    return {
      sample: ""
    }
  },
  async created () {
    const response: string = await this.$axios.$get(this.$config.apiURL).catch((err) => err)
    this.sample = response
    return
  }
})
</script>
