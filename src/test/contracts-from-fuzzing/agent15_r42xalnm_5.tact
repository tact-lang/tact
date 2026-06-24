contract FuzzOp {
    fun test(): Int {
         let x: Int = 1++2;
         return x;
    }
}
