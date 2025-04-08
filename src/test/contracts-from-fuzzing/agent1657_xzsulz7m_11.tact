struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}
struct Middle {
    x: Inner1;
    y: Inner2;
}
struct Top {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    data: Top;
    init() {
        self.data = Top{
            m: Middle{
                x: Inner1{a:1},
                y: Inner2{b:true}
            },
            flag: false
        };
    }
}