struct Inner1 { x: Int; }
struct Inner2 { flag: Bool; }

struct Outer {
    one: Inner1?;
    two: Inner2?;
}

contract OptNested {
    data: Outer;

    init() {
        self.data = Outer{
            one: null,
            two: Inner2{ flag: true }
        };
    }
}
