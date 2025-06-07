contract TestBool {
    flag: Bool = true;

    receive() {}

    // Getter returning a primitive Bool
    get fun getFlag(): Bool {
        return self.flag;
    }
}
