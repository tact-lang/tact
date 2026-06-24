struct OptionDeepDefault {
    a: Int?;
    b: InnerOptDefault;
}

struct InnerOptDefault {
    x: Int?;
    s: String?;
}

contract OptDeepDefTest {
    data: OptionDeepDefault;

    init() {
        self.data = OptionDeepDefault{
            a: null,
            b: InnerOptDefault{
                x: null,
                s: null
            }
        };
    }
}