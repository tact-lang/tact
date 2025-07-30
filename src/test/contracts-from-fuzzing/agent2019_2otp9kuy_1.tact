struct Nested {
    inner1: Int;
    inner2: String;
}

contract SingleFieldNested {
    data: Nested;

    init() {
        self.data = Nested{
            inner1: 1,
            inner2: "test"
        };
    }
}