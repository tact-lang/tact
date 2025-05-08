struct SimpleStruct { x: Int; }

contract TestContract {
    field: SimpleStruct;

    init() {
        self.field = SimpleStruct{ x: 123 };
    }
}