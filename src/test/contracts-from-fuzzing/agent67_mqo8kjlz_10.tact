struct Alternating {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
}

contract TestContract {
    data: Alternating;

    init() {
        self.data = Alternating{
            a:1,b:true,c:null,d:null,e:5,f:false
        };
    }
}