struct WithDefaults {
    n: Int = 7;
    m: Bool = false;
    txt: String = "abc";
    opt: Int?; // default is implicitly null
}

contract DefaultsContract {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}