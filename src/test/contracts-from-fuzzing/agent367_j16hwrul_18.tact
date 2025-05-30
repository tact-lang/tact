struct BigNested {
    a: Int;
    b: Inner1;
    c: Inner2;
    d: Inner3;
}

struct Inner1 {
    w: Bool;
    x: String;
}
struct Inner2 {
    y: Bool;
    z: String;
}
struct Inner3 {
    m: Int;
    n: Bool;
}

contract BigStructTest {
    store: BigNested;
    init() {
        self.store = BigNested{
            a:123,
            b:Inner1{w:true,x:"X"},
            c:Inner2{y:false,z:"Z"},
            d:Inner3{m:456,n:true}
        };
    }
}