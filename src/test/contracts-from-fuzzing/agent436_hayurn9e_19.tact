struct DeepDefaults {
    s1: HasDefaults;
    s2: HasDefaults;
}

contract TestContract {
    val: DeepDefaults;
    init() {
        self.val = DeepDefaults{
            s1: HasDefaults{},
            s2: HasDefaults{},
        };
    }
}

struct EmptyInner {
    f: Int;
}

struct HasDefaults {
    a: Int = 1;
    b: Int = 2;
    c: EmptyInner = EmptyInner{f: 3};
    d: Bool = true;
    e: String = "hello";
}
