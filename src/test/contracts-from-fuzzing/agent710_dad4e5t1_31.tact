struct SSub {
    num: Int = 0;
    txt: String = "";
    ok: Bool = false;
}

contract SSubTest {
    val: SSub = SSub{};

    init() {
        self.val = SSub{ num: 42, txt: "hi", ok: true };
    }
}