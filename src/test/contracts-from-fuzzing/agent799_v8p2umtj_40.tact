struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
}

contract SameTypeStructs {
    one: S1; 
    two: S2;

    init() {
        self.one = S1{a:1};
        self.two = S2{b:2};
    }
}