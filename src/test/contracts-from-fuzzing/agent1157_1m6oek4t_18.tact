struct OptBoolsStrings {
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
}

contract OptMixTest {
    val: OptBoolsStrings;

    init() {
        self.val = OptBoolsStrings{ b1: null, b2: null, s1: null, s2: null };
    }

    receive() {
        let tmp = self.val;
    }
}