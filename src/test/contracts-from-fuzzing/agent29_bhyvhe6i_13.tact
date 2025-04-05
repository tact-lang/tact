message Data {
    a: Int;
}

contract Test {
    receive() {
        let m: Data = Data { a: 1 };
        let a_value = m.a;
    }
}