struct MultiDefaultsNested {
    i: Int = 33;
    o: Bool = true;
    nest: SubNest;
}

struct SubNest {
    x: Int?;
    s: String = "def";
}

contract MultiDefaultsTest {
    val: MultiDefaultsNested;

    init() {
        self.val = MultiDefaultsNested{
            nest: SubNest{
                x: null
            }
        };
    }
}
