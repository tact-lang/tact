struct StringVariants {
    a: String;
    b: String?;
}

contract StringStorageTest {
    x: StringVariants;

    init() {
        self.x = StringVariants{
            a: "hello",
            b: null
        };
    }
}
