// optional entire struct assigned null
struct Big {
    a: Int;
    b: Bool;
    c: String;
}

contract OptWholeStruct {
    val: Big? = null;
    init() {
        self.val = null;
    }
}