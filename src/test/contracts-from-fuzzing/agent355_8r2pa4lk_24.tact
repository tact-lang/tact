struct SimpleOpt {
    f: Int?;
}

contract InitializeNull {
    s: SimpleOpt;

    init() {
        self.s = SimpleOpt{ f: null };
    }
}