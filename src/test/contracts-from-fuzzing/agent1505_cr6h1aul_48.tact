struct FlatStruct {
    a:Int;
    b:Bool;
    c:String;
    d:Address;
}

contract FlatPersistence {
    rec: FlatStruct;

    init() {
        self.rec = FlatStruct{ a:1, b:true, c:"ok", d:myAddress() };
    }
}