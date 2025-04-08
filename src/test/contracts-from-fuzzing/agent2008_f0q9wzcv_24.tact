struct SerialNestedOptional {
    value: Int? as uint64;
}

contract SerialNestedOptTest {
    data: SerialNestedOptional;

    init() {
        self.data = SerialNestedOptional{ value: null };
    }
}
