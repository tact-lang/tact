struct AA {
    a: Int = 1;
    b: Bool = false;
}
struct BB {
    aa: AA;
    c: String = "hi";
}
contract DoubleNesting {
    bb: BB;

    init() {
        self.bb = BB{aa: AA{a:2,b:true}, c:"done"};
    }
}