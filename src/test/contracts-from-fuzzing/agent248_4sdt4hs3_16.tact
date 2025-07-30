struct DeepDefault {
    x: Int = 42;
    y: Bool = true;
    msg: String = "hello";
}

contract TestContract {
    data: DeepDefault;

    init() {
        self.data = DeepDefault{};
    }
}