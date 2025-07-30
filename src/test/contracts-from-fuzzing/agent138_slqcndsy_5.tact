struct A { 
    a: Int; 
}
struct B {
    b: Int;
}
struct C {
    a: A;
    b: B;
    flag: Bool;
    text: String;
    opt: Int?;
}

contract Test {
    val: C;
    init() {
        self.val = C{
            a: A{a: 1},
            b: B{b: 2},
            flag: false,
            text: "hello",
            opt: null
        };
    }
}