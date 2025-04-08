struct InnerStructDefault {
    f1: Int = 5;
    f2: Bool = true;
}

struct OuterStructWithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: InnerStructDefault;
}

contract DefaultsContract {
    myfield: OuterStructWithDefaults;

    init() {
        self.myfield = OuterStructWithDefaults{
            c: InnerStructDefault{},
        };
    }
}
