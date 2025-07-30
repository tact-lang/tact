struct NestedA { inner: Int }
struct NestedB { nestedA: NestedA }
struct NestedC { nestedB: NestedB }

contract ChainPersistence {
    value: NestedC;
    init() {
        self.value = NestedC{ nestedB: NestedB{ nestedA: NestedA{ inner: 123 } } };
    }
}