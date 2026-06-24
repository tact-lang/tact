struct ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
}

contract TestContract {
    bs: ManyBools;

    init() {
        self.bs = ManyBools{
            b1:false, b2:true, b3:false, b4:true, b5:false,
            b6:false, b7:true, b8:true, b9:false, b10:true
        };
    }

    receive() {
        let _ = self.bs.b10;
    }
}