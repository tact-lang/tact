fun trailingSum(a: Int, b: Int, ): Int {
    return a + b;
}

contract TestTrailingComma {
    receive() {
        let res = trailingSum(2, 3, );
        if (res != 5) {
            throw(1);
        }
    }
}
