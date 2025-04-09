struct Inner {
    value: Int?;
    label: String;
}

struct Middle {
    a: Bool;
    b: Inner?;
}

struct Outer {
    title: String;
    mid: Middle;
    optionalMid: Middle?;
}

contract ComplexMixedTest {
    data: Outer;

    init() {
        self.data = Outer{
            title: "greetings",
            mid: Middle{ a: true, b: null },
            optionalMid: null
        };
    }

    receive() {
        let tmp = self.data;
    }
}