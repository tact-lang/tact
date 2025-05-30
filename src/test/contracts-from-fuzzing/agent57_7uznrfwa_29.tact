struct InnerArranged {
    b: Bool;
    s: String;
    i: Int;
}

contract FieldOrderTest {
    f1: InnerArranged;

    init() {
        self.f1 = InnerArranged{b:true,s:"hi",i:2};
    }
}