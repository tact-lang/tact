contract TestStringAsSlice {
    fun run() {
        let s: String = "hello";
        let sl: Slice = s.asSlice();
        dump(sl.bits());
    }
    
    receive() {
        self.run();
        cashback(sender());
    }
}
