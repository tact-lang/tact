struct OptionLevel2 {
    num: Int?;
    flag: Bool;
}

contract HoldsOption {
    val: OptionLevel2?;

    init() {
        self.val = null;
    }
}
