struct NestedOpt2 {
  inner: Int?;
}

struct NestedOpt1 {
  inner: NestedOpt2?;
}

contract SuperOpt {
  so: NestedOpt1;
  init() {
    self.so = NestedOpt1{inner:null};
  }
}