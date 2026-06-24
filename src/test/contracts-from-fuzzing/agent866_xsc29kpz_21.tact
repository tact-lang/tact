struct SConsts {
    x: Int = 1;
    y: Bool = true;
    z: String = "foo";
}

contract ConstStructs {
    val: SConsts;
    init() {
        self.val = SConsts{};
    }
}