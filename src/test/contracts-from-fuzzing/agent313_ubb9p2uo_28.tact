struct MixDefaultsOptionals {
    a: Int? = null;
    b: Bool = true;
    c: String?;
}

contract ComboStructTest {
    val: MixDefaultsOptionals;

    init() {
        self.val = MixDefaultsOptionals{ c: "abc" };
    }
}