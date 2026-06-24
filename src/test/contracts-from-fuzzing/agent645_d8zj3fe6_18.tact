struct ABig {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int?
}

struct BBig {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
}

contract Combination {
    a: ABig;
    b: BBig;

    init() {
        self.a = ABig{
            a:1,b:2,c:3,d:4,e:5,f: null
        };
        self.b = BBig{
            a:6,b:null,c:"text",d:true
        };
    }
}
