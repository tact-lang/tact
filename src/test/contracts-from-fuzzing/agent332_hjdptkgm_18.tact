struct Base {
    a: Int;
    b: Int?;
}

struct Wrapper {
    one: Base;
    two: Base;
    three: Base;
}

contract TestContract {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            one: Base{a:1, b:null},
            two: Base{a:2, b:2},
            three: Base{a:3, b:null}
        };
    }
}