struct SimpleOpt {
    x: Int?;
}

contract OptionalDefault {
    so: SimpleOpt;

    init() {
        self.so = SimpleOpt { x: null };
    }
}