struct Inner1 {
    x: Int = 1;
}

struct Middle1 {
    in1: Inner1;
}

struct Outer1 {
    mid: Middle1;
}

contract ThreeLevelNested {
    full: Outer1;
    init() {
        self.full = Outer1{
            mid: Middle1{
                in1: Inner1{ x: 42 }
            }
        };
    }
}