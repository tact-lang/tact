message Data {
    a: Int;
}

contract Test {
    receive() {
        let opt: Data? = Data { a: 1 };
    }
}