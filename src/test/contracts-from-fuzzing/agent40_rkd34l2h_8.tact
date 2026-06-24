struct ChildMap {
    value: Int;
}

struct ParentMap {
    children: map<Int, ChildMap>;
}

contract TestMap {
    receive() {
        let p = ParentMap { children: emptyMap() };
    }
}
