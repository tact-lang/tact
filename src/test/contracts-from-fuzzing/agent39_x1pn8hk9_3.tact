contract Recursive {
    fun test() {
        let s = initOf Recursive();
        let addr = contractAddress(s);
    }
}
