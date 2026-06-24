struct Chain1 { a: Int; }
struct Chain2 { c1: Chain1; b: Int; }
struct Chain3 { c2: Chain2; c: Int; }

contract C {
    ch3: Chain3;

    init() {
        self.ch3 = Chain3{c2: Chain2{c1: Chain1{a:1}, b:2}, c:3};
    }
}