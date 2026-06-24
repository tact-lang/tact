contract TestPrimitive() {
    fun test() {
        let a: Int = 1 + 1;
        let b: Int = 0b1010; // binary literal for 10
        let c: Bool = true && false; // should be false
        let s: String = "hello";
        let cellVal: Cell = s.asComment();
        dump(a); // expect 2
        dump(b); // expect 10
        dump(c); // expect false
        dump(s); // expect "hello"
    }
    receive() {
        self.test();
    }
}
