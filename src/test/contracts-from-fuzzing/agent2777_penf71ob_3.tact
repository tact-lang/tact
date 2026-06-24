struct NestedStruct {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    label: String;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{ x: 5, y: false, label: "test" },
            flag: true
        };
    }
}