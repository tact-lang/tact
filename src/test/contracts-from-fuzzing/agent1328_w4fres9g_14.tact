struct A {
    v: Int;
}

struct B {
    val: A?;
}

struct C {
    nest: B;
    s: String;
}

contract NestedOptString {
    data: C;

    init() {
        self.data = C{
            nest: B{ val: null },
            s: "end"
        };
    }
}
