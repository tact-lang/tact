contract MultOptNested {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    receive() {
        let _ = self.c;
    }
}