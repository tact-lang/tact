contract LoopTest {
    fun testLoop(): Int {
       let x: Int = 10;
       while (x > 0) {
           x -= 1;
       }
       return x;
    }
}
