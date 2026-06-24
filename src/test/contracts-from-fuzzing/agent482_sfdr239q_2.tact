struct Nested {
    x: Int;
    y: Int?;
}

contract DeepOptionalNested {
    data: Nested?;

    init() {
        self.data = null;
    }

    get fun getData(): Nested? {
        return self.data;
    }
}
