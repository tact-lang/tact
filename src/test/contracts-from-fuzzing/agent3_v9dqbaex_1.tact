contract TestPrimitive {
    val: Int = 42;

    receive() {}

    get fun getVal(): Int {
         return self.val;
    }
}
