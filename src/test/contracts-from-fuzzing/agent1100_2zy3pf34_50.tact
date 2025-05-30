struct InnerDefault {
    a: Int = 1;
}

contract InnerDefaultAssigned {
    d: InnerDefault;

    init() {
        self.d = InnerDefault{};
    }
}
