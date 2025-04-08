struct NestedOptionalField {
    val: Int?;
}

struct OuterOptionalHolder {
    nested: NestedOptionalField?;
}

contract NestedOptionalContract {
    outer: OuterOptionalHolder;

    init() {
        self.outer = OuterOptionalHolder{
            nested: null
        };
    }
}
