struct BoolWrapper {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract BooleansOnly {
    state: BoolWrapper;

    init() {
        self.state = BoolWrapper{
            b1:true, b2:false, b3:true, b4:true, b5:false,
        };
    }
}