message(1) A { val: Int }
message(2) B { flag: Bool }
message(3) C { txt: String }

contract MsgsAsStorage {
    ma: A;
    mb: B?;
    mc: C;

    init() {
        self.ma = A{ val: 11 };
        self.mb = null;
        self.mc = C{ txt: "hello" };
    }
}