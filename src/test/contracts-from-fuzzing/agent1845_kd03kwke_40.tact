// Optional slice and cell initialized explicitly to null
contract SliceCellNull {
  myslice: Slice?;
  mycell: Cell?;
  init() {
    self.myslice = null;
    self.mycell = null;
  }
}
