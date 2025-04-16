struct UnusualOrder {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: String?;
    f6: Bool?;
    f7: Int;
}

contract WeirdOrderTest {
    uo: UnusualOrder;

    init() {
        self.uo = UnusualOrder{
            f1:1, f2:true, f3:null, f4:"hi", f5:"bye", f6:null, f7:42
        };
    }
}