struct NestedManyLevels {
    a: Int;
}
struct Nested1 {
    inner: NestedManyLevels;
}
struct Nested2 {
    inner: Nested1;
}
struct Nested3 {
    inner: Nested2;
}
contract DeepNestingManyLevels {
    val: Nested3;

    init() {
        self.val = Nested3{ inner: Nested2{ inner: Nested1{ inner: NestedManyLevels{ a: 42 } } } };
    }
}
