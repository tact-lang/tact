struct Struct1 { a: Int; b: Bool; }
struct Struct2 { s1: Struct1; c: Int?; }
struct Struct3 { s2: Struct2; d: Bool; }

contract TestOrder {
    f: Struct3;

    init() {
        self.f = Struct3{
            s2: Struct2{
                s1: Struct1{
                    a:1,
                    b:false
                },
                c:null
            },
            d:true
        };
    }
}
