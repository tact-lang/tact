struct InnerDefault {
    x: Int = 7;
    y: String = "ok";
}

contract TestContract {
    defaults: InnerDefault;
    init() {
        self.defaults = InnerDefault{};
    }
}