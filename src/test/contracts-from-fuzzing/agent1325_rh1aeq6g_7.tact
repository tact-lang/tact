struct InnerDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "foo";
}

contract DefaultsContract {
    val: InnerDefault;

    init() {
        self.val = InnerDefault{};
    }
}