struct L1 { f1: Int } 
struct L2 { f2: L1 } 
struct L3 { f3: L2 } 
struct L4 { f4: L3 } 
struct L5 { f5: L4 } 
struct L6 { f6: L5 } 
struct L7 { f7: L6 } 
struct L8 { f8: L7 } 
struct L9 { f9: L8 } 
struct L10 { f10: L9 } 

contract DeepChain10 {
  nested: L10;

  init() {
    self.nested = L10{ f10: L9{ f9: L8{ f8: L7{ f7: L6{ f6: L5{ f5: L4{ f4: L3{ f3: L2{ f2: L1{ f1: 1 } } } } } } } } } };
  }
}