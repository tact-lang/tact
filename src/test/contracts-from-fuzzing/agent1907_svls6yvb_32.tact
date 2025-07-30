struct Inner1 {
    s: String;
    f: Bool;
}

struct Inner2 {
    i: Int;
    o: Int?;
}

struct Top {
    a: Inner1;
    b: Inner2;
}

contract CompositeNested {
    data: Top;

    init() {
        self.data = Top{
            a: Inner1{ s: "s", f: true },
            b: Inner2{ i: 42, o: null }
        };
    }
}