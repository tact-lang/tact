struct Outer {
    innerA: Inner1;
    innerB: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    text: String;
    flag: Bool?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerA: Inner1{ x:1, y:true },
            innerB: Inner2{ text:"hi", flag:false }
        };
    }
}