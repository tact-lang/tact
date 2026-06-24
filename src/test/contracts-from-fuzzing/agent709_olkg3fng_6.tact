struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
    flag: Bool;
}

struct Outer {
    x: Middle;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Middle{
                y: InnerMost{ z: 7 },
                flag: true,
            },
            text: "nested"
        };
    }
}