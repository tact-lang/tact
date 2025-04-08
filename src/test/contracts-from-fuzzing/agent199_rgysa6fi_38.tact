struct BoolStringStruct {
    flag: Bool;
    txt: String;
}

contract PersistentBoolString {
    val: BoolStringStruct;

    init() {
        self.val = BoolStringStruct{flag:true, txt:"hi"};
    }
}
