// optional of struct having optionals
struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract Test {
    data: Inner?;

    init() {
        self.data = null;
    }
}