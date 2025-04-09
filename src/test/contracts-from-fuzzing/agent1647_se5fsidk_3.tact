struct Nested {
    flag: Bool = true;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int = 42;
    s: String = "hi";
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            inner: InnerStruct{},
        };
    }
    receive() {}
}