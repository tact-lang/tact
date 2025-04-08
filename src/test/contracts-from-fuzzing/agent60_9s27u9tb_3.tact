struct A {
    x: Int;
}

struct B {
    nested: A;
    flag: Bool;
}

struct C {
    nested: B;
    text: String = "foo";
}

contract TestContract {
    c: C;

    init() {
        self.c = C{
            nested: B{
                nested: A{ x: 777 },
                flag: false
            },
            text: "bar"
        };
    }
}