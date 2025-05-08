contract TestMultipleBranches {
    fun f(x: Int): Int {
        if (x > 0) {
            if (x > 5) {
                return 10;
            } else {
                // No early return, control flows to final return
            }
        } else {
            return 20;
        }
        return 30;
    }
}
