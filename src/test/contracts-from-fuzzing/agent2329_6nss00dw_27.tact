struct OptionalLevel2 {
    lv2: Int?;
}

struct OptionalLevel1 {
    lv1: OptionalLevel2?;
}

contract DoubleOptField {
    val: OptionalLevel1;

    init() {
        self.val = OptionalLevel1{
            lv1: OptionalLevel2{ lv2: null }
        };
    }
}
