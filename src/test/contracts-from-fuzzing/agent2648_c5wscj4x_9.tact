struct Inner {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
}

struct Container {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    flag: Bool;
    opt_int: Int?;
}

contract ManyStructs {
    data: Container;

    init() {
        self.data = Container{
            s1: Inner{a:1,b:"x",c:true,d: null},
            s2: Inner{a:2,b:"y",c:false,d:3},
            s3: Inner{a:3,b:"z",c:true,d: null},
            flag: false,
            opt_int: 5
        };
    }
}