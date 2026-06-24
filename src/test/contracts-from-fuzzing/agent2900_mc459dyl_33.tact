struct Leaf {
    val: Int as uint32;
    mark: Bool?;
}

struct Middle {
    leaf: Leaf?;
    txt: String;
}

contract OptSerTest {
    m: Middle?;

    init() {
        self.m = null;
    }
}
