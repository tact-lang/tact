contract ReturnTest3 {
    fun test(a: Int): Int {
        {
            {
                if (a == 0) { return 0; }
            }
            if (a > 0) { return a; }
        }
        {
            return -a;
        }
    }
}
