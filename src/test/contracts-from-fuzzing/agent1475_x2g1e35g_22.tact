struct A {
    x: Int;
    y: Bool;
}

struct B {
    first: A;
    second: A;
}

contract DuplicateStructs {
    data: B;

    init() {
        self.data = B{
            first: A{x:1, y:true},
            second: A{x:2, y:false},
        };
    }
}