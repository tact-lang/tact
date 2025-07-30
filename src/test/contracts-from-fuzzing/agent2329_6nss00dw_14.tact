struct SOptional {
    f1: Int?;
    f2: Bool?;
}

contract OptionalStructTop {
    so: SOptional?;

    init() {
        self.so = null;
    }
}
