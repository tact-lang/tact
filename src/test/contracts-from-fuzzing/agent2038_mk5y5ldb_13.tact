struct LongOrder {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
}

contract C {
    lo: LongOrder;

    init() {
        self.lo = LongOrder{f1:1,f2:true,f3:"x",f4:2,f5:false,f6:"y"};
    }
}