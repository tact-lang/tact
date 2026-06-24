struct Deep {
    x: Int;
    y: Nested1;
}

struct Nested1 {
    a: Int;
    b: Nested2;
}

struct Nested2 {
    s: String;
    flag: Bool;
}

contract DeepStack {
    data: Deep;

    init() {
        self.data = Deep{
            x:5,
            y:Nested1{
                a:10,
                b:Nested2{ s:"str", flag:true }
            }
        };
    }
}