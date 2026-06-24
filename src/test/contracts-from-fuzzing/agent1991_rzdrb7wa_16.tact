contract ContractWithConstants {
    val: Int = 5;
    const magic: Int = 42;

    init() {
        self.val = 7 + self.magic;
    }
}