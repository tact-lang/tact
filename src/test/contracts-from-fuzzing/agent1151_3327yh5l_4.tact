struct Inner {
    s: String;
    b: Bool?;
}

struct Outer {
    f1: Int;
    f2: String;
    nest: Inner;
}

contract NestedStructFields {
    o: Outer;

    init() {
        self.o = Outer{
            f1: 1,
            f2: "hi",
            nest: Inner{
                s: "there",
                b: true
            }
        };
    }
}