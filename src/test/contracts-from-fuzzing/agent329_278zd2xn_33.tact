contract GetterContract(
    val1: Int,
    val2: Bool,
    val3: String,
) {
    get fun getVal1(): Int {
        return self.val1;
    }
    get fun getVal2(): Bool {
        return self.val2;
    }
    get fun getVal3(): String {
        return self.val3;
    }
}