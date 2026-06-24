contract MultiStepReturn {
    fun test() : Int {
        let a: Int = 2;
        let b: Int = 3;
        return a + b;
    }

    receive() {}
}
