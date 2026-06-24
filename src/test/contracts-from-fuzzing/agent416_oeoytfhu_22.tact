struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Int;
}
struct Combined {
    a: Inner1;
    b: Inner2;
}

contract Test22 {
    val: Combined;

    init() {
        self.val = Combined{
            a: Inner1{ x:1 },
            b: Inner2{ y:2 }
        };
    }
}
