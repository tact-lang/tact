struct MiddleLayer {
    inner: BottomLayer;
    flag: Bool;
    note: String;
}

struct BottomLayer {
    val: Int;
    comment: String?;
}

contract ContractWithMany {
    a: MiddleLayer;
    b: MiddleLayer;
    c: MiddleLayer;

    init() {
        self.a = MiddleLayer{ inner: BottomLayer{ val:1, comment:null }, flag:true, note:"A" };
        self.b = MiddleLayer{ inner: BottomLayer{ val:2, comment:"hi" }, flag:false, note:"B" };
        self.c = MiddleLayer{ inner: BottomLayer{ val:3, comment:null }, flag:true, note:"C" };
    }
}
