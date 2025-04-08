// Try very deeply nested structure with mixed optional levels
struct L4 { val: Int }
struct L3 { inner: L4? }
struct L2 { inner: L3 }
struct L1 { inner: L2? }

contract Deepest {
  d: L1;

  init() {
    self.d = L1{
      inner: L2{
        inner: L3{
          inner: L4{ val: 777 }
        }
      }
    };
  }
}