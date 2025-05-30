message Mixed {
    a: Int;
    b: Int?;
    c: Address;
}

contract Test {
    receive(msg: Mixed) {
        let a = msg.a;
        let b = msg.b;
        let c = msg.c;
    }
}