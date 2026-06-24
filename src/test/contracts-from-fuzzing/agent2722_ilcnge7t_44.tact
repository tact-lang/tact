// deeply nested optional inside optional container with inner struct

struct Bottom {
    y: Bool;
}

struct InnerOpt {
    m: Bottom?;
    z: Int;
}

contract DeepOpt {
    o: InnerOpt?;

    init() {
        self.o = InnerOpt {
            m: null,
            z: 10
        };
    }
}