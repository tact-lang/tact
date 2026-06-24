struct OptsOnly {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Address?;
    f5: Cell?;
    f6: Slice?;
}

contract Test {
    s: OptsOnly;

    init() {
        self.s = OptsOnly{
            f1:null, f2:null, f3:null, f4:null, f5:null, f6:null
        };
    }
    receive() {}
}