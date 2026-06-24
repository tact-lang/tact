struct WideBoolAndOpt {
    a0: Bool;
    a1: Bool?;
    a2: Bool;
    a3: Bool?;
    a4: Bool;
    a5: Bool?;
    a6: Bool;
    a7: Bool?;
    a8: Bool;
    a9: Bool?;
}

contract TestContract {
    data: WideBoolAndOpt;

    init() {
        self.data = WideBoolAndOpt{
            a0:true,a1:false,a2:true,a3:null,a4:true,
            a5:true,a6:false,a7:null,a8:false,a9:true
        };
    }
}