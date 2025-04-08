struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: String;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;
}

contract LargeFields {
    x: BigStruct;
    init() {
        self.x = BigStruct{
            f1:1,f2:2,f3:true,f4:"a",f5:"b",f6:myAddress(),
            f7:7,f8:false,f9:"c",f10:myAddress()
        };
    }
}
