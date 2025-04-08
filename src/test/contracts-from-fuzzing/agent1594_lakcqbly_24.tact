struct MyStruct { a: Int; b: Bool? = null; }

contract Test {
    field: MyStruct;
    init() {
        self.field = MyStruct{ a: 3 };
    }
}