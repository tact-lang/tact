struct A {
    val: Int;
}

struct B {
    prev: A;
    opt: Int?;
}

struct C {
    nest: B;
    text: String;
}

contract TestContract {
    payload: C;

    init() {
        self.payload = C{
            nest: B{
                prev: A{val: 10},
                opt: null
            },
            text: "fuzz"
        };
    }

    receive() {}
}