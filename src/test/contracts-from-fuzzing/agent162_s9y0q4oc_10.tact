struct BigNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    s: String;
    o: NestedOpt?;
}

struct NestedOpt {
    v: Int?;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 5,
            b: Inner1{ x: 1, y: false },
            c: Inner2{ s: "hi", o: null }
        };
    }
}