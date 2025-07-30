struct WithOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract OptionalDefaultsTest {
    val: WithOptionals;

    init() {
        self.val = WithOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
        };
    }
}