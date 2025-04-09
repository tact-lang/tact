// mixture of many optional and non-optional fields, including nested structs
struct MixInst {
    val1: Int;
    val2: Int?;
    val3: Bool;
    val4: Bool?;
    val5: String;
    val6: String?;
}

contract ComboStore {
    fieldA: MixInst;
    fieldB: MixInst?;

    init() {
        self.fieldA = MixInst{
            val1:1, val2:null, val3:true, val4:null, val5:"hi", val6:null
        };
        self.fieldB = null;
    }
}