struct A { b: Int; c: String; d: Bool }

struct B { a: A; s: String; n: Int }

contract TestContract {
    info: B;

    init() {
        self.info = B{
            a: A{ b: 1, c: "x", d: false },
            s: "hi",
            n: 5
        };
    }
}