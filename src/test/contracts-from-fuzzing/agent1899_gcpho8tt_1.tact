struct NestedDemo {
    name: String;
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    count: Int;
    optionalValue: Int?;
}

contract NestedStructTest {
    data: NestedDemo;

    init() {
        self.data = NestedDemo{
            name: "abc",
            flag: true,
            inner: InnerStruct{
                count: 42,
                optionalValue: null
            }
        };
    }
}