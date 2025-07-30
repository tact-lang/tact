struct Inner1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Inner2 {
    d: Int;
    e: Bool;
    f: String;
}

struct Outer {
    first: Inner1;
    second: Inner2;
    comment: String?;
}

contract ComplexNested {
    state: Outer;

    init() {
        self.state = Outer{
            first: Inner1{a:1,b:true,c:"one"},
            second: Inner2{d:2,e:false,f:"two"},
            comment: null
        };
    }
}