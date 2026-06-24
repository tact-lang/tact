contract TestBool {
    flag: Bool = true;
    
    receive() {}
    
    get fun getFlag(): Bool {
        return self.flag;
    }
}
