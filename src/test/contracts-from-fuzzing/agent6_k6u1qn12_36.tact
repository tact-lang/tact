struct V {
    i: Int;
}

contract Test {
    receive() {
        let v1 = V{ i: 1 };
        let v2: V = v1;
        let v3: V = V{ i:1 };
    }
}