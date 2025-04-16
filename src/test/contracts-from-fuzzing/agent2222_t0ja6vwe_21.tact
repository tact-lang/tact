struct Sub {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Outer {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            s1: Sub{a:null,b:null,c:null},
            s2: Sub{a:null,b:null,c:null},
            s3: Sub{a:null,b:null,c:null}
        };
    }
}