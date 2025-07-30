struct DefaultAndOpt {
    a: Int = 7;
    b: Bool?;
    c: String = "hi";
}

contract DefOptStructTest {
    val: DefaultAndOpt;

    init() {
        self.val = DefaultAndOpt{};
    }
}