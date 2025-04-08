struct Inner1 { a: Int; }
struct Inner2 { b: Inner1; }
struct Inner3 { c: Inner2; }
struct Inner4 { d: Inner3; }
struct Inner5 { e: Inner4; }

struct Container {
    val: Inner5;
    opt: Bool?;
    txt: String;
}

contract Test9 {
    data: Container;

    init() {
        self.data = Container{
            val: Inner5{ e: Inner4{ d: Inner3{ c: Inner2{ b: Inner1{ a: 42 } } } } },
            opt: true,
            txt: "Deep",
        };
    }
}