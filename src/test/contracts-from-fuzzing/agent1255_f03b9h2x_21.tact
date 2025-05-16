struct Nested {
    x: Int?;
}

contract Test21 {
    data: Nested?;

    init() {
        self.data = null;
    }
}