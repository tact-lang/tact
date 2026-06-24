contract TestTonNano {
    // Borderline valid: smallest nanoToncoin value
    nano: Int = ton("0.000000001");

    fun main(): Int {
        return self.nano;
    }
}
