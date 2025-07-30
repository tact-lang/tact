struct BigStruct {
    a1: Int; a2: Bool; a3: String; a4: Int; a5: Bool;
    a6: String; a7: Int; a8: Bool; a9: String; a10: Int;
    a11: Bool; a12: String; a13: Int; a14: Bool; a15: String;
    a16: Int; a17: Bool; a18: String; a19: Int; a20: Bool;
}

contract LargeStructContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a1:1,a2:true,a3:"a",a4:2,a5:false,
            a6:"b",a7:3,a8:true,a9:"c",a10:4,
            a11:false,a12:"d",a13:5,a14:true,a15:"e",
            a16:6,a17:false,a18:"f",a19:7,a20:true
        };
    }
}