struct SSS {
    x: Int;
    y: Bool;
    s: String;
}

contract ReplaceWholeStruct {
    val: SSS;
    init() {
        self.val = SSS{
            x:99,
            y:true,
            s:"replaced",
        };
    }
}