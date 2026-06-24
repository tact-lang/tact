struct RecDefaultInner {
    p: Int = 5;
    q: String = "in";
}

struct RecDefaultOuter {
    nested: RecDefaultInner = RecDefaultInner{};
    label: String = "out";
}

contract RecursiveDefaultsTest {
    val: RecDefaultOuter;

    init() {
        self.val = RecDefaultOuter{};
    }
}