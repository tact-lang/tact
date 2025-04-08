struct NestedStruct {
    inner: SimpleStruct;
    val: Int;
}

struct SimpleStruct { x: Int; y: Int; }

contract NestedStructContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: SimpleStruct{ x: 3, y: 4 }, val: 5 };
    }
}