struct Huge {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    a11: Bool; a12: String; a13: Bool; a14: String; a15: Int;
    a16: Int; a17: Bool; a18: Bool; a19: String; a20: String;
}

contract Wide {
    big: Huge;

    init() {
        self.big = Huge{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            a11:true,a12:"s",a13:false,a14:"x",a15:15,
            a16:16,a17:true,a18:false,a19:"q",a20:"z"
        };
    }
}