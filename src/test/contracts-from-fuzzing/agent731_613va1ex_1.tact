struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int = 123;
    flag: Bool = true;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: InnerStruct{} };
    }
}