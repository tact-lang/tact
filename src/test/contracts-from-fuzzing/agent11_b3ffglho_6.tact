struct NestedOptional {
    v: Int? as uint32;
}

contract Test {
    receive() {
        let s: NestedOptional = NestedOptional{
            v: null
        };
    }
}
