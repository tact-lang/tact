struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle1 {
    inner: Inner;
}

struct Middle2 {
    inner: Inner;
}

struct Middle3 {
    inner: Inner;
}

contract ManyNested {
    m1: Middle1;
    m2: Middle2;
    m3: Middle3;

    init() {
        let i1 = Inner{a:1,b:null};
        let i2 = Inner{a:2,b:true};
        let i3 = Inner{a:3,b:false};
        self.m1 = Middle1{inner:i1};
        self.m2 = Middle2{inner:i2};
        self.m3 = Middle3{inner:i3};
    }
}