struct DeepDefaults {
    a: Int = 1;
    next: DeepDefaults1 = DeepDefaults1{
        b: 2,
        next: DeepDefaults2{
            c: 3
        }
    };
}

struct DeepDefaults1 {
    b: Int = 20;
    next: DeepDefaults2;
}

struct DeepDefaults2 {
    c: Int = 30;
}

contract NestedDefaultValues {
    f: DeepDefaults;

    init() {
        self.f = DeepDefaults{
            a:42,
            next: DeepDefaults1{
                b:43,
                next: DeepDefaults2{ c:44 }
            }
        };
    }
}
