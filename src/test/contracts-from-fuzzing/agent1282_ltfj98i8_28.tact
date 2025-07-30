// Struct with lots of optional fields
struct OptFlood {
    a1: Int?; a2: Int?; a3: Int?; a4: Int?;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?;
    s1: String?; s2: String?; s3: String?; s4: String?;
}

contract StructOptionals {
    flood: OptFlood;

    init() {
        self.flood = OptFlood{
            a1:null,a2:null,a3:null,a4:null,
            b1:null,b2:null,b3:null,b4:null,
            s1:null,s2:null,s3:null,s4:null
        };
    }
}