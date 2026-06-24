struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Combined { x: Inner1; y: Inner2; }

contract TwoNest {
    val: Combined;
    init() {
        self.val = Combined{
            x: Inner1{ a: 10 },
            y: Inner2{ b: 20 }
        };
    }
}