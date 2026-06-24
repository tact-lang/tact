struct ABigStruct {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool;
}

contract ManyFields {
    data: ABigStruct;

    init() {
        self.data = ABigStruct{
            a0:0,a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,
            b0:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true,b9:false
        };
    }
}