contract TestTernary {
    fun choose() : Int {
         return true ? 1 : 2;
    }

    receive() {
         let value: Int = self.choose();
    }
}
