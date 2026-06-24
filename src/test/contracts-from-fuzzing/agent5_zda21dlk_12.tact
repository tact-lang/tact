contract TestDefaultOptional {
    val: Int? = null;

    receive() {}

    get fun get_val(): Int? {
         return self.val;
    }
}
