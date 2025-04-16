struct ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract LotsOfBools {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{ b1:true, b2:false, b3:true, b4:false, b5:true };
    }
}
