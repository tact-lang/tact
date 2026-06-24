struct DeepNested {
    a: Int;
    b: Bool;
}

struct MidNested {
    inner: DeepNested;
    tag: String;
}

struct Outer {
    m: MidNested;
    flag: Bool;
    comment: String;
}

contract NestedStructStorage {
    val: Outer;
    init() {
        self.val = Outer{
            m: MidNested{
                inner: DeepNested{
                    a: 2,
                    b: false
                },
                tag: "middle"
            },
            flag: true,
            comment: "outer"
        };
    }
}