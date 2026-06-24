struct NestedStructField {
    val: Int;
}

struct Holder {
    item: NestedStructField;
}

contract StructInStorage {
    nested: Holder;

    init() {
        self.nested = Holder{
            item: NestedStructField{ val: 42 }
        };
    }
}
