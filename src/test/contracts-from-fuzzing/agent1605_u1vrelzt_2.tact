struct NestedStruct {
    x: Int;
    y: Bool;
    s: String;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ x: 123, y: true, s: "xyz" };
    }

    receive() {
        self.data = NestedStruct{ x: 456, y: false, s: "abc" };
    }
}