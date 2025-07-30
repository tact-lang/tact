struct MultiBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
}

contract LotsOfBools {
    data: MultiBool;

    init() {
        self.data = MultiBool{
            b1:false,b2:true,b3:false,b4:true,
            b5:false,b6:true,b7:false,b8:true
        };
    }
}