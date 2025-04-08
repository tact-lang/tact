struct S {
    val: Int;
    opt: Bool?;
}

contract OptStructOpt {
    val: S?;

    init() {
        self.val = S{ val:42, opt:true };
    }
}