struct Inner1 {
    x: Int;
    y: Int?;
}

struct Inner2 {
    s: String;
    b: Bool?;
    nested: Inner1;
}

struct Middle {
    inner1: Inner1;
    inner2: Inner2;
    flag: Bool;
    text: String?;
}

contract TestContract {
    state: Middle;

    init() {
        self.state = Middle{
            inner1: Inner1{x: 5, y: null},
            inner2: Inner2{s: "hi", b: true, nested: Inner1{x:9,y:7}},
            flag: false,
            text: null
        };
    }
}