struct FlatBool {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool = false;
    b4: Bool = true;
    b5: Bool = false;
    b6: Bool = true;
    b7: Bool = false;
    b8: Bool = true;
}

contract BoolStorage {
    flags: FlatBool;

    init() {
        self.flags = FlatBool{
            b1: true, b2: false, b3:true, b4:false,
            b5:true, b6:false, b7:true, b8:false
        };
    }
}