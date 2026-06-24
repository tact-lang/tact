struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct Inner4 { d: Int; }

struct ComplexStruct {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
    f4: Inner4;
    val: Int;
    flag: Bool;
    comment: String;
}

contract ComplexLayout {
    v: ComplexStruct;

    init() {
        self.v = ComplexStruct{
            f1: Inner1{ a:1 },
            f2: Inner2{ b:2 },
            f3: Inner3{ c:3 },
            f4: Inner4{ d:4 },
            val: 42,
            flag: true,
            comment: "hello fuzz"
        };
    }
}