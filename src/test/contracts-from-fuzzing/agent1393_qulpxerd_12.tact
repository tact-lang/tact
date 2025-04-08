// Struct with a large chain of nested structs (deep single-path)
struct L5 { v: Int }
struct L4 { child: L5 }
struct L3 { child: L4 }
struct L2 { child: L3 }
struct L1 { child: L2 }

contract DeepChain {
  root: L1;

  init() {
    self.root = L1{
      child: L2{
        child: L3{
          child: L4{
            child: L5{
              v: 42
            }
          }
        }
      }
    };
  }
}
