struct AlmostEmpty {
    a: Int;
}

contract MinimalNested {
    data: AlmostEmpty;

    init() {
        self.data = AlmostEmpty{a:1};
    }
}