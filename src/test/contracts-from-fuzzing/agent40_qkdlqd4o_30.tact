struct BasicStruct {
    i: Int;
    b: Bool;
}

contract PersistentBasic {
    val: BasicStruct;

    init() {
        self.val = BasicStruct{i:5,b:true};
    }
}