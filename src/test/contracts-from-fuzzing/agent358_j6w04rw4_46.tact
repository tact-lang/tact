contract OptLowLevel {
  builderOpt: Builder? = null;
  sliceOpt: Slice? = null;

  init() {
    self.builderOpt = null;
    self.sliceOpt = null;
  }
}