struct InnerMost {
    z: Int;
    flag: Bool?;
}

struct Inner {
    x: Int;
    y: InnerMost;
    name: String;
}

contract NestTest {
    complex: Inner;

    init() {
        self.complex = Inner{
            x: 7,
            y: InnerMost{
                z: 99,
                flag: true,
            },
            name: "nested",
        };
    }
}