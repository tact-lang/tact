// Fuzz test for partial default init of nested struct
struct Child {
    a: Int = 1;
    b: Bool = true;
}

struct Parent {
    c: String;
    d: Child;
}

contract TestContract {
    par: Parent = Parent{
        c: "hi",
        d: Child{}
    };
}