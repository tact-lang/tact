struct Nested {
    x: Int;
    y: String?;
}

contract TestContract {
    data: Nested?;

    init() {
        self.data = Nested{
            x: 5,
            y: null
        };
    }
}