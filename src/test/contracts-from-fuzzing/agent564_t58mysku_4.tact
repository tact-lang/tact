struct DeepNested {
    s1: Int;
    opt: Bool?;
    s2: Int;
}

struct Container {
    first: Int;
    mid: DeepNested;
    last: Bool;
}

contract ManyLayers {
    data: Container;

    init() {
        self.data = Container{
            first: 0,
            mid: DeepNested { s1: 10, opt: null, s2: 20 },
            last: true
        };
    }

    receive() {
        self.data.mid.s2 = self.data.mid.s2 + 1;
    }
}