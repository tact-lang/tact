struct InnerOfInner {
    a: Int;
    b: Bool;
}

struct MidStruct {
    foo: InnerOfInner;
    opt: String?;
}

struct OuterStruct {
    m: MidStruct;
    q: String;
}

contract VeryDeepNested {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            m: MidStruct{
                foo: InnerOfInner{
                    a: 123,
                    b: true,
                },
                opt: "optional",
            },
            q: "done",
        };
    }
}
