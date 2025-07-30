struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int?;
}
struct Container {
    i1: Inner1?;
    i2: Inner2?;
}

contract MultiOptInner {
    c: Container;
    init() {
        self.c = Container{
            i1:null,
            i2:null
        };
    }
}