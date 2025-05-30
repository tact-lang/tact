struct ManyOptionBool {
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?;
    b6: Bool?; b7: Bool?; b8: Bool?; b9: Bool?; b10: Bool?;
}
contract ManyBoolOptions {
    val: ManyOptionBool;
    init() {
        self.val = ManyOptionBool{
            b1: null, b2: true, b3:null, b4:true, b5:null,
            b6:true, b7:null, b8:true, b9:null, b10:true
        };
    }
}