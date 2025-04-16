contract TestWhileReturn2 {
    fun f(): Int {
        let i: Int = 0;
        while (i < 5) {
            if (i == 3) { return i; }
            i = i + 1;
        }
        return 10;
    }
}
