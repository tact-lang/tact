struct Inner1 {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

struct Inner2 {
    x: Int?;
    y: Bool;
    z: String?;
    w: String;
}

struct Container {
    left: Inner1;
    right: Inner2;
}

contract WideNested {
    data: Container;

    init() {
        self.data = Container{
            left: Inner1{a:1,b:true,c:"A",d:null},
            right: Inner2{x:2,y:false,z:"B",w:"C"},
        };
    }
}