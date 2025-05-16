struct InnerFielded {
    intf: Int;
    boolf: Bool;
    strf: String;
}

contract MultipleInnerStructs {
    f1: InnerFielded;
    f2: InnerFielded;

    init() {
        self.f1 = InnerFielded{intf:1, boolf:true, strf:"a"};
        self.f2 = InnerFielded{intf:2, boolf:false, strf:"b"};
    }
}