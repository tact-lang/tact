message M {
    mapField: map<Int, Int>;
}

contract Test {
    receive(msg: M) {
        // map inside message
    }
}