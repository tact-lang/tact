trait StorageTrait {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract StorageTraitImpl with StorageTrait {
    val1: Int;
    val2: Bool;
    val3: String;

    init() {
        self.val1 = 10;
        self.val2 = true;
        self.val3 = "test";
    }
}
