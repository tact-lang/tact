struct InnerA { a: Int; }
struct InnerB { b: Bool; }
struct Outer {
  i: InnerA;
  j: InnerB;
}

contract DeepPersistent {
    data: Outer;

    init() {
        self.data = Outer{
            i: InnerA{a:10},
            j: InnerB{b:true}
        };
    }
}