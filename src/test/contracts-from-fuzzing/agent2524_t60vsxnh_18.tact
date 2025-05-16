struct Nest {
    foo: Int;
    bar: Bool?;
}

contract InitNested {
    data: Nest;

    init() {
        self.data = Nest{ foo: 123, bar: null };
    }
}