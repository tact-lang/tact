struct Deep {
    z: Int;
}

struct Mid {
    y: Bool = true;
    deepOpt: Deep?;
}

struct Outer {
    midOpt: Mid?;
    label: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ midOpt: null, label: "abc" };
    }
}