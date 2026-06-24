struct SSub {
    f: Int = 7;
    g: Bool?;
}

struct SMain {
    foo: Int;
    bar: SSub;
    baz: String;
}

contract Defaulted {
    data: SMain;

    init() {
        self.data = SMain{
            foo: 1,
            bar: SSub{
                g: true
            },
            baz: "hello"
        };
    }
}