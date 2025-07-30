struct ManyBooleans {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
}

contract BoolHeavy {
    data: ManyBooleans;

    init() {
        self.data = ManyBooleans{b1:false, b2:true, b3:false, b4:true, b5:false};
    }
}