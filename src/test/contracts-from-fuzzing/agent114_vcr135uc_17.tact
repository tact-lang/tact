struct HasDefaults {
    s: String = "def";
    n: Int = 10;
}

struct HasDefaultNested {
    inner: HasDefaults;
    m: String = "nest";
}

contract DefaultStructs {
    val: HasDefaultNested;

    init() {
        self.val = HasDefaultNested{
            inner: HasDefaults{},
            m: "override"
        };
    }
}
