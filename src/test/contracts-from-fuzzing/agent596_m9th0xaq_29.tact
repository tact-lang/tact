struct OptMixNested {
    a: Int?;
    b: Bool?;
    c: Inner1?;
}

struct Inner1 {
    x: Int;
    y: Bool;
    z: Inner2;
}

struct Inner2 {
    flag: Bool?;
    count: Int?;
}

contract ComplexNull {
    val: OptMixNested;

    init() {
        self.val = OptMixNested{
            a:null,b:null,c:Inner1{ x:3,y:true,z:Inner2{flag:null,count:5}}
        };
    }
}