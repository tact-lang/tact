struct Nested {
    x: Int;
    y: Bool;
}

contract DeepStruct {
    val: Nested;

    init() {
        self.val = Nested{
            x: 42,
            y: true,
        };
    }
}