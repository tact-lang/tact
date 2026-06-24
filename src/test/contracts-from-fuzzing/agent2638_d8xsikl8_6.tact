struct Inner {
    a: Int;
    b: Bool;
    c: String?;
    d: Address?;
}

contract ManyStructs {
    x: Inner;
    y: Inner;
    z: Inner;
    
    init() {
        self.x = Inner{ a:1, b:true, c:null, d:null };
        self.y = Inner{ a:2, b:false, c:"abc", d:myAddress() };
        self.z = Inner{ a:3, b:true, c:null, d:null };
    }
}