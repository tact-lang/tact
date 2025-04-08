struct OptLeaf {
    leaf: Int?;
}

struct Inner {
    innerLeaf: OptLeaf?;
}

struct Outer {
    first: Inner?;
    second: Inner?;
    third: Inner?;
}

contract TestContract {
    deepOpt: Outer;
    init() {
        self.deepOpt = Outer{
            first: null,
            second: Inner{ innerLeaf: null },
            third: null
        };
    }
}
