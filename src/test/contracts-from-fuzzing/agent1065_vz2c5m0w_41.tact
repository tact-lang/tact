// Testing contract field with a struct holding optional
struct SOpt {
    optVal: Int?;
}

contract StructWithOptField {
    data: SOpt;

    init() {
        self.data = SOpt{ optVal: null };
    }
}
