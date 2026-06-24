struct S {
    flag: Bool;
    txt: String;
    addr: Address;
    n: Int?;
}

contract Test {
    s: S;

    init() {
        self.s = S{flag:true, txt:"hi", addr:myAddress(), n:null};
    }
}