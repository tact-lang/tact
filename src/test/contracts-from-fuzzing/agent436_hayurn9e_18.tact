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

contract TestContract {
    val: HasDefaults;
    init() {
        self.val = HasDefaults{};
    }
}
