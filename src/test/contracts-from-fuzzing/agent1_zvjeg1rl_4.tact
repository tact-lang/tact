contract Test14 {
    fun foreachTest(): Int {
       let m: map<Int, Int> = emptyMap();
       m.set(1, 10);
       m.set(2, 20);
       let sum: Int = 0;
       foreach (k, v in m) {
           try {
                if (k == 2) {
                   throw(5);
                } else {
                   sum += v;
                }
           } catch (err) {
                sum += err;
           }
       }
       return sum;
    }
}
