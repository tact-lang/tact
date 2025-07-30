contract TestOptional {
    x: Int? = null;

    receive() {}

    get fun getOpt(): Int? {
         return self.x;
    }
}
