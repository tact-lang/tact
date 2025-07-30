struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    i: Int;
    inn: Inner;
    s: String;
}

contract NestedDefaults {
    rec: Outer;

    init() {
        self.rec = Outer{
            i: 1,
            inn: Inner{x: 2, y:3},
            s: "ok"
        };
    }
}