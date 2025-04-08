struct InnerStruct {
    x: Int;
    y: Bool;
    s: String;
}

contract NestedContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ x: 7, y: false, s: "hello" };
    }
}
