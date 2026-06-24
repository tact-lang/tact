struct L4 { val: Int; }
struct L3 { inner: L4; }
struct L2 { inner: L3; }
struct L1 { inner: L2; }

contract SuperDeep {
  data: L1;

  init() {
    self.data = L1{
      inner: L2{
        inner: L3{
          inner: L4{ val: 7 }
        }
      }
    };
  }
}
