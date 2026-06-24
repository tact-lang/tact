struct L8 { last: Int; }
struct L7 { inner: L8; }
struct L6 { inner: L7; }
struct L5 { inner: L6; }
struct L4 { inner: L5; }
struct L3 { inner: L4; }
struct L2 { inner: L3; }
struct L1 { inner: L2; }
struct Root { inner: L1; }

contract DeepChain {
  root: Root;

  init() {
    self.root = Root {
      inner: L1 {
        inner: L2 {
          inner: L3 {
            inner: L4 {
              inner: L5 {
                inner: L6 {
                  inner: L7 {
                    inner: L8 {
                      last: 42
                    }
                  }
                }
              }
            }
          }
        }
      }
    };
  }
}