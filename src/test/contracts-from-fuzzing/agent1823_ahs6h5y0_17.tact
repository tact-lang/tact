struct DeepDefaults {
    a: Int = 1;
    b: NestedDefaults;
}

struct NestedDefaults {
    c: Int = 2;
    d: Bool = false;
}

contract DefaultsDeep {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{
            a:10,
            b: NestedDefaults{c:20,d:true}
        };
    }
}