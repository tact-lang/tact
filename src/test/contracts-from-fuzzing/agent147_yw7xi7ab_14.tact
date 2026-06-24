struct OptInner { a: Int?; b: Bool?; c: String?; }

struct Container {
    x: Int;
    inner: OptInner; 
    y: Bool;
    z: String;
}

contract C {
    f: Container;
    init() {
        self.f = Container{
            x:1, inner: OptInner{a:null,b:null,c:null}, y:true, z:"hello"
        };
    }
}