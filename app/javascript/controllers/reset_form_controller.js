import { Controller } from "@hotwired/stimulus";

export default class extends Controllers {
  reset() {
    this.element.reset();
  }
}
