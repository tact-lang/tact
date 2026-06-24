struct SOpt {
    foo: Int?; 
    bar: Bool?; 
    baz: String?;
}

contract DefaultInitOptionalNested {
    so1: SOpt = SOpt{foo:null,bar:null,baz:null};
    so2: SOpt = SOpt{foo:null,bar:null,baz:null};
    
    init() {
        self.so1 = SOpt{foo:null,bar:null,baz:null};
        self.so2 = SOpt{foo:null,bar:null,baz:null};
    }
}
