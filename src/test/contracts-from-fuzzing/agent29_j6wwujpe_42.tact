struct Chain1 {
    a: Int;
}
struct Chain2 {
    b: Chain1;
}
struct Chain3 {
    c: Chain2;
}

contract ChainNestedContract {
    saved: Chain3;

    init() {
        self.saved = Chain3{
            c: Chain2{
                b: Chain1{a:99}
            }
        };
    }
}