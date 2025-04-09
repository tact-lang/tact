contract TestNestedBlock {
    fun nested(x: Int) : Int {
         { 
             let a: Int = 10;
             if (x < a) { return a; }
         }
         return x;
    }
}
