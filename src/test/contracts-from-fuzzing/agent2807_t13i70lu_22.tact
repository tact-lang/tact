struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptOptStruct {
    val: InnerOpt?;
    init() {
        self.val = null;
    }
}