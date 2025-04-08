struct Child {
    foo: Int?;
    bar: Bool?;
}

contract Test {
    data: Child? = null;

    init() {
        self.data = Child{ foo: 10, bar: true };
    }

    receive() {}
}