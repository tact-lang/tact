struct BB {
    a: Int;
    b: Int?;
    c: Int;
}

contract OptionMiddle {
    val: BB;

    init() {
        self.val = BB{a:1,b:null,c:2};
    }
}