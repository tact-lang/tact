struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Nested1 {
    i: Flat;
    j: String;
}

struct Nested2 {
    k: Int;
    l: Bool;
    m: String;
    n: Nested1;
}

contract TestContract {
    data: Nested2;

    init() {
        self.data = Nested2{
            k:123,
            l:true,
            m:"abc",
            n:Nested1{
                i: Flat{
                    a:1, b:false, c:"x", d:null, e:true, f:null
                },
                j:"nested"
            }
        };
    }
}