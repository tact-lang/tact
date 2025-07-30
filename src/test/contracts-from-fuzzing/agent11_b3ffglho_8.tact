struct NestedMap {
    m: map<Int,Int> as uint32;
}

contract Test {
    receive() {
        let s: NestedMap = NestedMap{
            m: emptyMap()
        };
    }
}
