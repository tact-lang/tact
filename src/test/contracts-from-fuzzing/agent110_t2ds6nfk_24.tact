struct B {
    n: Int;
    flag: Bool;
}

struct A {
    wrapped: B?;
    msg: String;
}

contract NestedOpt {
    val: A;
    init() {
        self.val = A{wrapped:null, msg: "hi"};
    }
}