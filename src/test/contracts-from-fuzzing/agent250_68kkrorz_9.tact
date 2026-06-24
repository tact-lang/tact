struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    text: String;
    opt: Int?;
}

contract ManyStructsContract {
    store: Outer;

    init() {
        self.store = Outer{
            in1: Inner{a:1,b:true},
            in2: Inner{a:2,b:false},
            text:"hi",
            opt:null
        };
    }
}