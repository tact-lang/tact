struct VarOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

contract VarOrderContract {
    data: VarOrder;

    init() {
        self.data = VarOrder{
            a:1,b:true,c:"hi",d:2,e:false,f:"bye"
        };
    }
}
