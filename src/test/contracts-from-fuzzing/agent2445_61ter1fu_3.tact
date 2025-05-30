struct Inner {
    value: Int = 5;
    flag: Bool?;
}

struct Outer {
    label: String = "label";
    data: Inner;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            data: Inner{
                flag: true,
            },
        };
    }

    receive() {}
}