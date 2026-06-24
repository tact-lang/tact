contract Various {
    intField:Int;
    boolField:Bool;
    addrField:Address;
    cellField:Cell;
    stringField:String;
    optInt:Int?;
    optBool:Bool?;
    optAddr:Address?;
    optCell:Cell?;
    optString:String?;

    init() {
        self.intField=1;
        self.boolField=true;
        self.addrField=myAddress();
        self.cellField=emptyCell();
        self.stringField="s";
        self.optInt=null;
        self.optBool=null;
        self.optAddr=null;
        self.optCell=null;
        self.optString=null;
    }
}