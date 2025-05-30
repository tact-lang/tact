struct DeeplyOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Opts {
    o1: DeeplyOptional?;
    o2: DeeplyOptional?;

    init() {
        self.o1 = null;
        self.o2 = DeeplyOptional{
            x: 5,
            y: true,
            z: "ok"
        };
    }
}