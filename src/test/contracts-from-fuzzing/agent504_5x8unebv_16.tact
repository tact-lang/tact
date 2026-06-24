struct Middle {
    m1: Int;
    m2: String?;
}

struct Outer {
    outerField: Middle?;
    flag: Bool;
}

contract OptionalStructChain {
    content: Outer;

    init() {
        self.content = Outer{
            outerField: Middle{
                m1: 42,
                m2: null,
            },
            flag: true,
        };
    }

    receive() {
        let c = self.content;
    }
}