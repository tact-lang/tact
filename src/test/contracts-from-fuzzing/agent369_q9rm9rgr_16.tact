struct ManyBools {
    b01: Bool; b02: Bool; b03: Bool; b04: Bool; b05: Bool;
    b06: Bool; b07: Bool; b08: Bool; b09: Bool; b10: Bool;
    b11: Bool; b12: Bool; b13: Bool; b14: Bool; b15: Bool;
    b16: Bool; b17: Bool; b18: Bool; b19: Bool; b20: Bool;
}

contract TestContract {
    flags: ManyBools;
    init(){
        self.flags=ManyBools{
            b01:true,b02:false,b03:true,b04:false,b05:true,
            b06:true,b07:false,b08:true,b09:false,b10:true,
            b11:true,b12:false,b13:true,b14:false,b15:true,
            b16:true,b17:false,b18:true,b19:false,b20:true
        };
    }
}