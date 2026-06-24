struct S1 {
    s: String;
}

struct S2 {
    b: Bool;
}

struct Combined {
    optS1: S1?;
    optS2: S2?;
}

contract NestedContainedOptionals {
    s: Combined = Combined{optS1: null, optS2: null};
    receive() {
        self.s = Combined{optS1: S1{s: "abc"}, optS2: S2{b: true}};
    }
}