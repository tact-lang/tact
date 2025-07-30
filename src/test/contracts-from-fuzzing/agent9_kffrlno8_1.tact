contract TestConst1 {
    // Contract constant computed at compile-time
    const C: Int = 1 + 2;

    // Getter function to return the constant's value
    get fun getC(): Int {
        return self.C;
    }
}
