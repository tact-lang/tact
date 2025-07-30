struct Inner {
    i1: Int = 10;
    flag: Bool = false;
    txt: String = "abc";
}

contract NestStructTest {
    data: Inner;

    init() {
        self.data = Inner{};
    }
}
