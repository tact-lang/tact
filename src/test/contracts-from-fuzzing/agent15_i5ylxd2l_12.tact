contract TestContract {
    fun getOptional(): Int? {
        return null;
    }

    receive() {
        let x: Int? = self.getOptional();
    }
}
