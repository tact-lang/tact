contract TestOptional {
    fun getOpt() : Int? {
         return 123;
    }
    receive() {
         let o: Int? = self.getOpt();
         if (o != null) {
              let v: Int = o!!;
         }
    }
}
