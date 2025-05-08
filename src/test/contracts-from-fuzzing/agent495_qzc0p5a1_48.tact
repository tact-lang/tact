struct OptStrSlice {
  s: String?;
  sl: Slice?;
}
contract OptStrSliceC {
  data: OptStrSlice;
  init(){
    self.data = OptStrSlice{ s:null, sl:null };
  }
}