contract ManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;
    a6: Address;
    a7: Address;
    a8: Address;
    a9: Address;
    a10: Address;
    
    init() {
        let addr = myAddress();
        self.a1=addr; self.a2=addr; self.a3=addr; self.a4=addr; self.a5=addr;
        self.a6=addr; self.a7=addr; self.a8=addr; self.a9=addr; self.a10=addr;
    }
}