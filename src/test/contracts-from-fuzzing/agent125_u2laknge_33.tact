// Large nested structs with diverse fields
struct N1 {
    a: Int;
    b: Bool?;
}

struct N2 {
    x: String;
    y: N1;
    z: Int?;
}

struct N3 {
    k: N2;
    m: Bool;
}

contract BigNested {
    data: N3;

    init() {
        self.data = N3{
            k: N2{
                x: "abc",
                y: N1{a:10,b:true},
                z:null,
            },
            m:false,
        };
    }
}