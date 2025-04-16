struct DeepDefault {
    num: Int = 5;
    flag: Bool = false;
    text: String = "hi";
    opt: Int? = null;
}

contract DefaultStructTest {
    data: DeepDefault;

    init() {
        self.data = DeepDefault{};
    }
}
