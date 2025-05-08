struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    number: Int;
    flag: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{ number: 42, flag: true }
        };
    }
}