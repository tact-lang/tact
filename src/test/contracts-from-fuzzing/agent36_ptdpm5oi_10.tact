struct Info {
    city: String;
    age: Int;
    married: Bool;
}

contract WideStorage {
    a: Int = -1;
    b: Bool = true;
    c: String = "hi";
    d: Int?;               // nullable primitives
    e: String?;
    f: Bool?; 
    g: Info?;             // nullable struct
    h: Info;              // nested struct
    
    init() {
        self.d = 123;
        self.e = "bye";
        self.f = false;
        self.g = Info{ city: "London", age: 40, married: true };
        self.h = Info{ city: "Paris", age: 30, married: false };
    }

    receive() {
        let _ = self.a; let _ = self.b; let _ = self.c;
        let _ = self.d; let _ = self.e; let _ = self.f;
        let _ = self.g; let _ = self.h;
    }
}