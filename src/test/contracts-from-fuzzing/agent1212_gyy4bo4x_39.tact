struct DeeplyNested {
    a: Int = 1;
    b: Sub1;
}

struct Sub1 {
    c: Int = 2;
    d: Sub2;
}

struct Sub2 {
    e: Int = 3;
}

contract DeepDefaults {
    val: DeeplyNested;
    init() {
        self.val = DeeplyNested{
            b: Sub1{
                d: Sub2{}
            }
        };
    }
}