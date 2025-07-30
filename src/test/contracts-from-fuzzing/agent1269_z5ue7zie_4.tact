struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    n: DeepNested;
    s: String;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            mid: Middle{
                n: DeepNested{x: 123, y: false},
                s: "nested",
            },
            flag: true
        };
    }
}