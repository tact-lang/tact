contract TestContract {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}