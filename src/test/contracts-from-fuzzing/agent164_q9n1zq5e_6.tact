struct BigStruct {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int?;
    a7: Int?;
    a8: Int;
    a9: Int;
    a10: String;
    a11: String;
    a12: String?;
    a13: Bool;
    a14: Bool?;
    a15: Int;
    a16: Int;
    a17: Int;
    a18: Int?;
    a19: Int;
}

contract TestContract {
    big: BigStruct = BigStruct{
        a0:0,a1:1,a2:2,a3:3,a4:4,a5:5,
        a6:null,a7:null,a8:8,a9:9,
        a10:"A",a11:"B",a12:null,
        a13:true,a14:null,
        a15:15,a16:16,a17:17,a18:null,a19:19
    };

    receive() {
        let _ = self.big.a10;
    }
}