struct S {
    val: Int;
}

struct Outer {
    s: S?;
    name: String;
}

contract OptStruct {
    info: Outer = Outer{
        s: null,
        name: "foo"
    };

    init() {
        self.info = Outer{
            s: S{ val: 42 },
            name: "bar"
        };
    }
}