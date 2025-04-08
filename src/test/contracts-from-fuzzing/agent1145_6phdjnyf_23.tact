struct MinimalPersist {
    a: Int;
}

contract MinimalPersistTest {
    val: MinimalPersist;

    init() {
        self.val = MinimalPersist{ a: 123 };
    }
}
