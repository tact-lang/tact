struct InnerFields {
    intf: Int;
    boolf: Bool;
    strf: String;
}

contract StructWithAllBasic {
    rec: InnerFields;

    init() {
        self.rec = InnerFields{intf:42,boolf:true,strf:"hi"};
    }
}