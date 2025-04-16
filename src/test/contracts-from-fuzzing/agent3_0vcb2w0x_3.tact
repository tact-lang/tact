contract TestTryCatchValid {
    fun safeDivide(a: Int, b: Int): Int {
        try {
            let res = a / b;
            return res;
        } catch (err) {
            return -1;
        }
    }
}
