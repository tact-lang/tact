contract FuzzMalformed3 {
    fun test() : Int {
        // Malformed operator usage: '++' is not a valid operator
        let y: Int = 1 ++ 2;
        return y;
    }
}
