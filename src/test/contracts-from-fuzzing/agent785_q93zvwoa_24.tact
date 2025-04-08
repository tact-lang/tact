struct Inner {
    s: String;
}

struct Outer {
    opt: Inner?;
    flag: Bool;
}

contract NestedOptMid {
    o: Outer;

    init() {
        self.o = Outer{
            opt: null,
            flag: true,
        };
    }
}