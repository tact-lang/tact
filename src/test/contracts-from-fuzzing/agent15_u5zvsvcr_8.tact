contract TestUnaryMinusFixed {
    fun test() : Int {
         return -(-123);
    }
    receive() {
          self.test();
    }
}
