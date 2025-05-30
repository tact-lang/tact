contract Test3 {
    fun f(): Int {
        {
            let x: Int = 10;
            if (x > 5) {
                return x;
            }
        }
        return 0;
    }
    
    receive() {}
}
