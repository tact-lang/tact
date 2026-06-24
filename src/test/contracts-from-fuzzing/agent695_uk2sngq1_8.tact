struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Int;
}
struct Wrapper {
    a: Inner1;
    b: Inner2;
}

contract CrossStructs {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: Inner1{ x: 1 },
            b: Inner2{ y: 2 },
        };
    }
}