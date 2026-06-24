struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct Outer {
    nested: Inner?;
}

contract ManyOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{}
        };
    }
}