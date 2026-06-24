struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: String;
}

contract Test9 {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            a: null,
            b: null,
            c: null
        };
    }
}