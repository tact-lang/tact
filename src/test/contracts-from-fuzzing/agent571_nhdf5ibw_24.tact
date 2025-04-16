struct Opt1 { a: Int; }
struct Opt2 { b: Bool; }

struct Container {
    o1: Opt1?;
    o2: Opt2?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{o1: null, o2: null};
    }
}