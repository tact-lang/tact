struct NestedDefaults {
    nested1: Inner1;
    nested2: Inner2;
}

struct Inner1 {
    x: Int = 1;
    y: Bool = false;
}

struct Inner2 {
    msg: String = "hi";
    num: Int = 42;
}

contract TestContract {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{
            nested1: Inner1{},
            nested2: Inner2{}
        };
    }
}