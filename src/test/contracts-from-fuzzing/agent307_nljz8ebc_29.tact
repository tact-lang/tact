struct Wrapper {
    a: Int?;
    b: Bool?;
    c: String?;
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract NullableNested {
    value: Wrapper;
    init() {
        self.value = Wrapper{
            a: 5,
            b: null,
            c: null,
            s: SubStruct{ x: 7, y: true },
        };
    }
}