contract Test8_Corrected {
    fun returnOptional(a: Int): Int? {
        if(a > 0) { return a; }
        return null;
    }
}
