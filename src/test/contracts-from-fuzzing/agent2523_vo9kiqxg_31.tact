// nested with lots of defaults
struct Leaf {
   a: Int=7;
   b: Bool=true;
   c: String="d";
}
struct Mid {
   leaf: Leaf;
   value: Int=99;
}
contract NestedDefaults2 {
  data: Mid;
  init() {
    self.data = Mid{
      leaf:Leaf{},
    };
  }
}
