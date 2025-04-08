contract TestContract(
    x: Int,
    y: Bool
) {
    const MY_CONST: Int = 7;

    fun someFunc(): Int {
        return self.x + (self.y ? 1 : 0);
    }

    receive() {
        self.someFunc();
    }
}