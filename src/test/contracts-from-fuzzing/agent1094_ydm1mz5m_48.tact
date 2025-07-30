struct DeepIn {
    val: Int;
}

struct MidIn {
    deep: DeepIn;
}

contract MidDeep {
    val: MidIn;
    init() {
        self.val = MidIn{deep: DeepIn{val:55}};
    }
}