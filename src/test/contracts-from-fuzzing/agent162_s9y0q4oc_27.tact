struct InnerDefault {
    x: Int = 5;
}

contract TestContract {
    data: InnerDefault;

    init() {
        self.data = InnerDefault{};
    }
}