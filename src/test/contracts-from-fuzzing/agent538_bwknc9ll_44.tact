struct BoolWrap {
    b: Bool;
}

contract PersistentBool {
    val: BoolWrap;

    init() {
        self.val = BoolWrap{b:true};
    }
}