struct TrailingCommaStruct {
    a: Int;
    b: Int;
}

contract TrailingCommaTest {
    data: TrailingCommaStruct;

    init() {
        self.data = TrailingCommaStruct{
            a: 1,
            b: 2,
        };
    }
}
