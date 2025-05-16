struct ManyNested {
    s1: Inner;
    s2: Inner;
    s3: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract MultiInner {
    d: ManyNested = ManyNested{
        s1:Inner{foo:1,bar:true},
        s2:Inner{foo:2,bar:null},
        s3:Inner{foo:3,bar:null},
    };
}