struct Embedded {
    val: Int = 7;
}

contract NestedInitDefaults {
    e: Embedded;

    init() {
        self.e = Embedded{};
    }
}
