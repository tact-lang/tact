contract TestNestedTryCatch {
    fun divideNested(x: Int, y: Int): Int {
        try {
            try {
                let res = x / y;
                return res;
            } catch (e) {
                return 100;
            }
        } catch (err) {
            return -999;
        }
    }
}
