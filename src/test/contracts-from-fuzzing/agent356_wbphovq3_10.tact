struct NullableStruct {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract NullableTest {
    state: NullableStruct;

    init() {
        self.state = NullableStruct{
            foo: null,
            bar: null,
            text: null
        };
    }
}