struct Pair {
    a: Int;
    b: Bool;
}

contract OptionalNested {
    data: Pair?;

    init() {
        self.data = Pair{
            a: 42,
            b: true
        };
    }
}
