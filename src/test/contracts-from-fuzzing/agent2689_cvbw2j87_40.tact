contract OptionalMixPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;
    regInt: Int;
    regBool: Bool;
    regStr: String;

    init() {
        self.optInt=null; self.optBool=null; self.optString=null;
        self.optSlice=null; self.optCell=null; self.optAddr=null;
        self.regInt=0; self.regBool=false; self.regStr="";
    }
}