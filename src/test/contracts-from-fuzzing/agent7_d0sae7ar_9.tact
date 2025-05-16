contract Test {
    const FLAG: Bool = true;
    
    get fun getFlag(): Bool {
         return self.FLAG;
    }
}
