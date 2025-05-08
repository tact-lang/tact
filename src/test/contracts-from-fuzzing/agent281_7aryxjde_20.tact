struct ManyBools {
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool;
    b10: Bool; b11: Bool; b12: Bool; b13: Bool; b14: Bool;
    b15: Bool; b16: Bool; b17: Bool; b18: Bool; b19: Bool;
}

contract BoolStore {
    m: ManyBools;

    init() {
        self.m = ManyBools{
            b0: true, b1: false, b2: true, b3: false, b4: true,
            b5: false, b6: true, b7: true, b8: false, b9: true,
            b10: false, b11:true, b12:false, b13:true, b14:false,
            b15:true, b16:false, b17:true, b18:false, b19:true
        };
    }
}