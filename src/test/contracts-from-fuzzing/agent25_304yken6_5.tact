contract Test2 {
    receive () {}
    
    fun loopReturn(n: Int): Int {
        let mutable_i: Int = 0;  
        // we use a mutable variable by reassigning the let binding
        while (mutable_i < n) {
            if (mutable_i == 2) { 
                return mutable_i;
            }
            mutable_i = mutable_i + 1;
        }
        return mutable_i;
    }
}
