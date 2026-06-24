contract Test {
    const FLAG: Bool = false;

    get fun getVal(): Int {
        return self.FLAG ? 1 : 2;
    }
}
