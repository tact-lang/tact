struct Wrap {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
}

contract OptionWrap {
    val: Wrap;

    init() {
        self.val = Wrap{a:1, b: null, c:true, d:null};
    }
}
