struct NestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Holder {
    x: Int;
    y: NestedOptional;
    z: String;
}

contract OptionalNestedStruct {
    opt: Holder;

    init() {
        self.opt = Holder{
            x: 1,
            y: NestedOptional{
                a: null,
                b: null,
                c: null
            },
            z: "test"
        };
    }
}