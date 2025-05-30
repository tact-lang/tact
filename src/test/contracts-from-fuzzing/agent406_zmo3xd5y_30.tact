struct FooDefOpt {
    x: Int? = 1;
    y: Bool? = false;
    z: String? = "bar";
}

contract InitDefaultOpt {
    rec: FooDefOpt;
    init() {
        self.rec = FooDefOpt{};
    }
}