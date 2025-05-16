struct NestedStruct {
    inner1: Int;
    inner2: Bool;
    inner3: String?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner1: 42,
            inner2: true,
            inner3: "hello",
        };
    }
}