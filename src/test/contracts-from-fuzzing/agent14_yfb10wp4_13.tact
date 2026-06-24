contract TestNonNullAssertion {
    fun getMaybe(): Int? { return 7; }

    receive() {
        let a: Int? = self.getMaybe();
        dump(a!!);
    }
}
