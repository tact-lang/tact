// Contract with nested struct redeclaring default values
struct SInner {
   x: Int? = null;
   y: Bool = true;
}

contract NestedDefaults {
   s: SInner;
   init() {
     self.s = SInner{};
   }
}