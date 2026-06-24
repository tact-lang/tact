struct S1 {
    a: Int;
    b: Bool?
}

struct S2 {
    c: S1;
    d: Bool?;
    e: String?;
}

contract CombineNormals {
    val: S2;

    init() {
        self.val = S2{
            c:S1{a:1,b:null},
            d:null,
            e:null
        };
    }
}