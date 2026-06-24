struct Rec {
    a: Int;
}

struct RecOpt {
    inner: Rec?;
}

contract RecTest {
    val: RecOpt;
    init() {
        self.val = RecOpt{ inner: null };
    }
}