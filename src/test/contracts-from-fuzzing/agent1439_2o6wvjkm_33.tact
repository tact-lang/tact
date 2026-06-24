struct Struct1 {
    foo: Int?;
}

struct Struct2 {
    innerStruct: Struct1?;
}

contract DeepOptStructDefault {
    s: Struct2;
    init() {
        self.s = Struct2{ innerStruct: null };
    }
}