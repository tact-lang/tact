struct Inner1 {
    x: Int;
    y: Int;
}

struct Inner2 {
    a: Bool;
    b: String;
}

struct Mix {
    one: Inner1;
    two: Inner2;
    num: Int;
}

contract MixedDeep {
    data: Mix;

    init() {
        self.data = Mix{
            one: Inner1{x:1,y:2},
            two: Inner2{a:true,b:"hi"},
            num:99
        };
    }
}
