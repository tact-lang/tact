struct Sub { a: Int; b: Bool; c: String; d: Int?; }

struct Sup { s1: Sub; s2: Sub; s3: Sub; }

contract StructArrayLike {
    big: Sup;

    init() {
        self.big = Sup{
            s1: Sub{a:1, b:true, c:"A", d:null},
            s2: Sub{a:2, b:false, c:"B", d:null},
            s3: Sub{a:3, b:true, c:"C", d:null}
        };
    }
}