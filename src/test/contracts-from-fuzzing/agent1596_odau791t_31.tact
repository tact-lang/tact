contract ContractWithManyPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: String = "z";
    d: Int? = null;
    e: Bool? = false;
    f: String? = "test";
    g: Int = -1;
    h: Bool = false;
    i: String = "x";
    receive() {
        let _ = self.i;
    }
}