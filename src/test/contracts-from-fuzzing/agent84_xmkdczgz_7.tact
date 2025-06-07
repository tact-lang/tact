contract TestOptional {
    fun getOpt(flag: Bool): Int? {
        if (flag) { return 99; }
        return null;
    }
    
    receive() {
        let x: Int = self.getOpt(true)!!;
        dump(x);
    }
}
