struct NestedWithDefaults {
    value: Int = 5;
    flag: Bool = true;
}

struct Holder {
    nested: NestedWithDefaults;
    text: String = "hello";
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder{ nested: NestedWithDefaults{}, text: "world" };
    }
}