struct Sub {
    v1: Int; 
    v2: Bool; 
    v3: String; 
    v4: Int?;
}

contract ManySubFields {
    a: Sub;
    b: Sub;
    c: Sub;
    d: Sub;
    e: Sub;
    f: Sub;
    g: Sub;
    
    init() {
        self.a = Sub{v1:1,v2:true,v3:"a",v4:null};
        self.b = Sub{v1:2,v2:false,v3:"b",v4:null};
        self.c = Sub{v1:3,v2:true,v3:"c",v4:null};
        self.d = Sub{v1:4,v2:false,v3:"d",v4:null};
        self.e = Sub{v1:5,v2:true,v3:"e",v4:null};
        self.f = Sub{v1:6,v2:false,v3:"f",v4:null};
        self.g = Sub{v1:7,v2:true,v3:"g",v4:null};
    }
}
