struct DeepNested {
    a: Int;
    b: String;
    c: Bool;
}

struct Middle {
    nested: DeepNested;
    optField: Int?;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            m: Middle{
                nested: DeepNested{
                    a: 1,
                    b: "str",
                    c: true
                },
                optField: null
            },
            flag: false
        };
    }
}