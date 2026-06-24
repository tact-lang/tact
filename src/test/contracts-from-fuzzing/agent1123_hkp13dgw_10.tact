struct OptOpt {
    val: Int?;
    text: String?;
    flag: Bool?;
}

contract OptTest {
    inner: OptOpt;

    init() {
        self.inner = OptOpt{
            val: null,
            text: null,
            flag: null,
        };
    }
}