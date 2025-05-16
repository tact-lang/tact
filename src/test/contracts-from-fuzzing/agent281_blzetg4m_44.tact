// Compose deeply nested field chain with mix of primitives, optionals and defaults
struct S4 { f: Int? }
struct S3 { s: S4 }
struct S2 { s: S3 }
struct S1 { s: S2 }

contract DeepChainMix {
 root: S1;

 init() {
   self.root = S1{
     s: S2{
        s: S3{
          s: S4{ f: null }
        }
     }
   };
 }
}