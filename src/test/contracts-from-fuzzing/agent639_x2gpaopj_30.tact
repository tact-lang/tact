struct SInnerOpt {
    val: Int?;
}

contract DirectOptStruct {
    s: SInnerOpt?;
    init() {
        self.s = null;
    }
}