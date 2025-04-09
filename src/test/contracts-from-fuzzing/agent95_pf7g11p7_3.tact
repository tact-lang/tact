contract BoolTest {
    fun test() {
        let a: Bool = true && false; // expected false
        let b: Bool = !true;         // expected false
        dump(a);
        dump(b);
    }
    receive() {
        self.test();
    }
}
