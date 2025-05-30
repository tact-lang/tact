struct Data { a: Int }

contract NullableStruct {
    a: Data?;

    init() {
        self.a = null;
    }
}
