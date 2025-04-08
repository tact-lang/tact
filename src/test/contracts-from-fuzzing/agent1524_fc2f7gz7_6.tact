struct Rec1 {
    a: Int;
    b: Bool;
}

struct Wrapper1 {
    rec: Rec1;
    more: Bool;
}

contract MultiNested {
    wrapped: Wrapper1;

    init() {
        self.wrapped = Wrapper1{
            rec: Rec1{ a: 7, b: false },
            more: true
        };
    }
}