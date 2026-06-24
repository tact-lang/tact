struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    id: Int;
    name: String;
    innerOpt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            id: 5,
            name: "opt nested",
            innerOpt: null
        };
    }
}