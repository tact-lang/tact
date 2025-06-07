contract Test4 {
    val: Int?;

    init() {
        self.val = null;
    }

    get fun getOptional(): Int? {
        return self.val;
    }

    receive() {}
}
