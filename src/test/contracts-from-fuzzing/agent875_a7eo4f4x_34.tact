struct ManyBoolInts {
    b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    i1: Int; i2: Int; i3: Int; i4: Int;
}

contract ManyBoolIntsContract {
    f: ManyBoolInts;
    init() {
        self.f = ManyBoolInts{
            b1:true,b2:false,b3:true,b4:false,
            i1:1,i2:2,i3:3,i4:4
        };
    }
}