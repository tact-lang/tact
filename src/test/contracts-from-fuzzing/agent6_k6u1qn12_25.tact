struct Weird {
    f1: Int;
    f2: Int;
}

contract Test {
    receive() {
        let w1 = Weird{ f1:1, f2:2 };
        let w2 = Weird{ f2:2, f1:1 };
    }
}