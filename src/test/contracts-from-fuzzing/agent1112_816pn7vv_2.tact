struct Nested {
    level: InnerStruct;
}

struct InnerStruct {
    deep: Bool;
}

contract Test {
    f: Nested;
    init() {
        self.f = Nested{level: InnerStruct{deep: false}};
    }
}