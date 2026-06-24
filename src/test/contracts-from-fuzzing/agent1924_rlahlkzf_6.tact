struct MultiOptionalDeep {
    a: Int?;
    b: Bool?;
    sub: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: MultiOptionalDeep;

    init() {
        self.data = MultiOptionalDeep{
            a: 1,
            b: null,
            sub: SubStruct{
                x: 42,
                y: false
            }
        };
    }
}