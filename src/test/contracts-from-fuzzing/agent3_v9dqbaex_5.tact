contract TestOptional {
    opt: Int? = null;

    receive() {}

    get fun getOpt(): Int? {
         return self.opt;
    }
}
