struct Nested {
    s: SubStruct;
}

struct SubStruct {
    f1: Int?;
    f2: Bool?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            s: SubStruct{
                f1: 42,
                f2: true
            }
        };
    }
}