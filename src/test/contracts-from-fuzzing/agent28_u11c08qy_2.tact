contract TestBool {
    flag: Bool = true;
    
    // Minimal receive function
    receive() {}
    
    // Getter returning a Bool value
    get fun getFlag(): Bool {
        return self.flag;
    }
}