struct MultiNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Deeper;
}

struct Deeper {
    q: Bool?;
    s: Cell?;
}

contract Complex {
    field: MultiNested;

    init() {
        self.field = MultiNested{
          a:1,
          b: Inner{
            x:2,
            y: Deeper{ q:null, s:null }
          }
        };
    }
}