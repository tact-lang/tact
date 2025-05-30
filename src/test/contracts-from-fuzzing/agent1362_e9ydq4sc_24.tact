struct Inner1 { val: Int; }
struct Inner2 { val: String; }

struct Container {
    a: Inner1;
    b: Inner2;
}

contract Test {
    c: Container? = null;

    init() {
        self.c = Container{
            a: Inner1{ val: 5 },
            b: Inner2{ val: "bar" }
        };
    }

    receive() {}
}