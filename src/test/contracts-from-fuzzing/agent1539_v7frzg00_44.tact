struct Inner1 {
    a: Int;
    b: Bool;
}
struct Inner2 {
    c: String;
}

struct Container {
    i1: Inner1;
    i2: Inner2;
}
contract TwoInners {
    data: Container;
    init() {
        self.data = Container{
            i1: Inner1{a:1,b:false},
            i2: Inner2{c:"test"}
        };
    }
}