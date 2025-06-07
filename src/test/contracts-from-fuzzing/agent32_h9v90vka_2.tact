struct Nested {
    inner: InnerStruct;
    flag: Bool?;
}

struct InnerStruct {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{ a: 1, b: null },
            flag: true
        };
    }
}