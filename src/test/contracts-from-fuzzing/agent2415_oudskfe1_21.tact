struct OptionInside {
    s: String?;
    b: Bool?;
}

contract OptInsideTest {
    val: OptionInside?;

    init() {
        self.val = OptionInside{
            s: null,
            b: true
        };
    }
}