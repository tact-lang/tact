contract TestReturn {
    // Minimal nested block with return
    fun f_nested(): Int {
         { return 42; }
    }
}
