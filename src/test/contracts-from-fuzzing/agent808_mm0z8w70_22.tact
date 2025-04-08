struct ComboStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract ComboFields {
    val: ComboStruct;

    init() {
        self.val = ComboStruct{ x:1, y:null, z:"hi" };
    }
}