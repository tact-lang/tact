contract ManualMethodIdGetter {
    const mid: Int = 16384 + 42;

    // Manually specifying the getter's method id using a comptime expression
    get(self.mid)
    fun get_value(): Int {
         return self.mid + 1;
    }

    receive() {}
}
