struct InnerMost {
    a: Int as uint8 = 7;   
    b: Bool = false;      
}

struct Nested {
    im: InnerMost;         
    flag: Bool = true;    
}

struct Outer {
    nested: Nested;       
    counter: Int as int16 = -5; 
    txt: String = "ok";  
}

contract DeepStore {
    store: Outer = Outer{
        nested: Nested{
            im: InnerMost{},
            flag: true
        },
        counter: -123,
        txt: "hi"
    };

    init() {}
}
