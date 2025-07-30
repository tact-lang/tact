struct Part {
    a: Int;
    b: String;
    c: Bool;
}

contract ManySeparate {
    p1: Part;
    p2: Part;
    p3: Part;
    p4: Part;

    init() {
        self.p1 = Part{a:1,b:"",c:false};
        self.p2 = Part{a:2,b:"",c:true};
        self.p3 = Part{a:3,b:"",c:false};
        self.p4 = Part{a:4,b:"",c:true};
    }
}