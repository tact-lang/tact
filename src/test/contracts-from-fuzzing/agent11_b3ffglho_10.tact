struct NestedMap {
    m: map<Int,Int>;
}

contract Test {
    receive() {
        let s: NestedMap = NestedMap {
            m: emptyMap()
        };
    }
}
