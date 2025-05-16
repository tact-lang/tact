struct InnerMost { flag: Bool; }

struct Inner {
    v1: Int;
    v2: String;
    nested: InnerMost;
    opt: String?;
}

struct Outer {
    data: Inner;
    number: Int;
    anotherFlag: Bool;
}

contract ManyLayers {
    content: Outer;

    init() {
        self.content = Outer{
            data: Inner{v1:5, v2:"abc", nested:InnerMost{flag:true}, opt:null},
            number: 7,
            anotherFlag: false
        };
    }
}