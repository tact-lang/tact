contract TestTonValid {
    one: Int = ton("1");

    fun main(): Int {
        return self.one;
    }
}
