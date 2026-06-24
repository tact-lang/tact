struct Inner1 { a: Int; }
struct Inner2 { b: String; }

struct Combined {
    x: Inner1;
    y: Inner2;
}

contract MultipleStructRefs {
    comb: Combined;

    init() {
        self.comb = Combined{ x: Inner1{a:1}, y: Inner2{b:"hi"} };
    }
}
