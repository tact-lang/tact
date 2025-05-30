contract TestCastingCoercion {
    fun getNumber(): Int { return 100; }
    receive() {
        let n: Int = self.getNumber();
        let s: String = n.toString();
        dump(s);
    }
}
