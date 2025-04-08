struct InnerMost {
 x: Int;
}

struct Intermediate {
 inner: InnerMost;
}

contract ChainNest {
 val: Intermediate;

 init() {
  self.val = Intermediate{ inner: InnerMost{ x: 5 } };
 }
}