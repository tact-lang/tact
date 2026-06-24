struct Outer {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    x: Bool;
    y: Int?;
}

struct Inner2 {
    z: String;
}

contract MultiInnerTest {
    data: Outer;

    init() {
        self.data = Outer{
            s1: Inner1{x:false,y:null},
            s2: Inner2{z:"x"}
        };
    }
}