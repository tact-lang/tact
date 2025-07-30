struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Topper {
    first: Inner1;
    second: Inner2;
}

contract MultiNested {
    both: Topper;

    init() {
        self.both = Topper{
            first: Inner1{ x:1 },
            second: Inner2{ y:2 }
        };
    }
}