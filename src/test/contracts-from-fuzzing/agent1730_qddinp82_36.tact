struct HasStr {
    s: String;
}

contract PrimAndStruct {
    n: Int;
    h: HasStr;

    init() {
        self.n = 77;
        self.h = HasStr{ s: "hi" };
    }
}