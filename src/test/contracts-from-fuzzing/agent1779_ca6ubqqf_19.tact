struct Opt1 { a: Int?; }
struct OptNest {
    x: Int;
    opt: Opt1?;
}

contract OptionalInsideOptional {
    data: OptNest;
    init() {
        self.data = OptNest{x: 10, opt: null};
    }
}