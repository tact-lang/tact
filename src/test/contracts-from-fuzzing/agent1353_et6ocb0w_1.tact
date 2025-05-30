struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    amount: Int;
    note: String;
}

contract TestContract {
    nestedData: Nested;

    init() {
        self.nestedData = Nested{
            inner: InnerStruct{
                flag: true,
                amount: 123,
                note: "test",
            }
        };
    }
}