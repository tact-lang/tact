struct Opt1 { a: Int? }
struct Opt2 { b: Int? }
struct Opt3 {
    f1: Opt1?;
    f2: Opt2?;
}

contract OptionalStructs {
    st: Opt3;

    init() {
        self.st = Opt3{
            f1: Opt1{a: null},
            f2: null
        };
    }
}
