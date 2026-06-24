struct Params {
    a: Int as int64;
    b: Bool?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int = 1;
    y: Bool = false;
    z: String = "x";
}

contract NestedDefaults {
    f: Params;

    init() {
        self.f = Params{
            a: 5,
            b: null,
            c: InnerStruct{}
        };
    }
}