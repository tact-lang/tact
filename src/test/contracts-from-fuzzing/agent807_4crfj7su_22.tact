// test contract with very large struct containing nested structs and optionals
struct Piece1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

struct Piece2 {
    f: String?;
    g: Bool;
    h: Int?;
    j: String;
}

struct Huge {
    p1: Piece1;
    p2: Piece2;
    msg: String?;
    flag: Bool;
    flag2: Bool?;
}

contract HugeStorage {
    payload: Huge;
    init() {
        self.payload = Huge{
            p1: Piece1{ a:1, b:true, c:"foo", d:null, e:null },
            p2: Piece2{f:null, g:false, h:7, j:"bar"},
            msg: null,
            flag: true,
            flag2: null,
        };
    }
}