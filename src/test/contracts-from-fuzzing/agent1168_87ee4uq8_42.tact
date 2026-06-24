struct OptionStringInt {
    optStr: String?;
    optInt: Int?;
}

contract OptionOpt {
    val: OptionStringInt;

    init() {
        self.val = OptionStringInt{
            optStr: null,
            optInt: null
        };
    }
}