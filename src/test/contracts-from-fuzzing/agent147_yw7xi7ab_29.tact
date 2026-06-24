struct InnerMost {
 val: Int;
}

struct Mid {
 im: InnerMost;
}

struct Outer {
 mid: Mid;
}

contract DeepAssign {
 o: Outer;
 init() {
  self.o = Outer{ mid: Mid{ im: InnerMost{ val: 42 } } };
 }
}