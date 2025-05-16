struct NestedOptionalFields {
    foo: Int?;
    bar: SubStruct?;
}

struct SubStruct {
    name: String;
    amount: Int;
    active: Bool;
}

contract TestContract {
    persist: NestedOptionalFields;

    init() {
        self.persist = NestedOptionalFields{ foo: null, bar: null };
    }
}
