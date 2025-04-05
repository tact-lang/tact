struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

contract Test {
    receive() {
        let x: S2 = S2 { s1: S1{a: 10}, b: 20 };
    }
}