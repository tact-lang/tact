struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructTest {
    val: WithOptionals;

    init() {
        self.val = WithOptionals{a: null, b: true, c: "hi"};
    }
}