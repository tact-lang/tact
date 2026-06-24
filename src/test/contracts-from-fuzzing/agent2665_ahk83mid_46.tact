struct S1 {
    s: String;
}

struct S2 {
    x: Int;
    y: S1;
}

contract NestedStrings {
    data: S2;

    init() {
        self.data = S2{
            x:7,
            y:S1{s:"hello"}
        };
    }
}