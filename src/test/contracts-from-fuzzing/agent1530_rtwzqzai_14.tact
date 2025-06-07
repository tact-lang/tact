struct SubLevel {
    val: Int;
}

struct NestedStruct {
    sub: SubLevel?;
}

struct MoreNested {
    deep: NestedStruct?;
}

contract TestContract {
    field: MoreNested;

    init() {
        self.field = MoreNested{ deep: null };
    }
}
