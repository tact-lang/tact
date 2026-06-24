struct InnerDeep {
    x: Int;
    y: Int;
    z: Int;
}

struct MiddleDeep {
    inner: InnerDeep;
    str: String;
}

struct OuterDeep {
    middle: MiddleDeep;
    flag: Bool;
    optionalCell: Cell?;
}

contract MultilevelNestedOptional {
    complex: OuterDeep;

    init() {
        self.complex = OuterDeep{
            middle: MiddleDeep{
                inner: InnerDeep{ x:1, y:2, z:3 },
                str: "go"
            },
            flag: true,
            optionalCell: null
        };
    }
}