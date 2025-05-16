struct ContainsMap {
    m: map<Int, Int>;
}

struct ContainsStructWithMap {
    inner: ContainsMap;
}

contract NestedMapField {
    field: ContainsStructWithMap;
    init() {
        self.field = ContainsStructWithMap{ inner: ContainsMap{ m: emptyMap() } };
    }
}