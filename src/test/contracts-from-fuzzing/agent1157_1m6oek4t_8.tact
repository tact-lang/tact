struct StringHolder {
    s1: String;
    s2: String?;
}

contract OptStringTest {
    val: StringHolder;

    init() {
        self.val = StringHolder{ s1: "abc", s2: null };
    }

    receive() {
        let tmp = self.val;
    }
}