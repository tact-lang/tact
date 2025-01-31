contract Test {
    const A: Int = self.value;

    value: Int = 10;

    get fun getConstant(): Int {
        return self.A;
    }
}
