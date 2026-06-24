struct SC {
    v: Int?; 
}
struct SB {
    sc: SC = SC{ v: 7 }; 
    optS: String? = null;
}
struct SA {
    sb: SB;  
}

contract PartialDefaultFields {
    foo: Int?;        
    bar: String?;     
    baz: SA;          

    init() {
        self.foo = 1;
        self.bar = null;
        self.baz = SA{ sb: SB{} };
    }
}