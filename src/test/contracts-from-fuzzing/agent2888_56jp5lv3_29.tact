// nested struct with optional defaulted bool inside optional outer
struct Inner {
    flag: Bool = false;
}

struct Outer {
    inr: Inner?;
}

contract DeepDefaults {
    o: Outer;
    init() {
        self.o = Outer{
            inr: null,
        };
    }
}