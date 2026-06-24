// Compose large nested struct with mix of types, no maps
struct Deep {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    s: String?;
    flag: Bool;
}

struct Inner2 {
    sub: Level3;
}

struct Level3 {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    val: Deep;

    init() {
        self.val = Deep{
            a: 5,
            b: Inner1{ s:null, flag:true },
            c: Inner2{ sub: Level3{ x:null, y:false } }
        };
    }
}