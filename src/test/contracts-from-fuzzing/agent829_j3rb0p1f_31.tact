struct ChainOpt {
    a: Int?;
    b: Bool?;
}

contract ManyTopLevelOpt {
    x: Int?;
    y: Bool?;
    c: ChainOpt;

    init() {
        self.x = null;
        self.y = null;
        self.c = ChainOpt{
            a: null,
            b: null,
        };
    }
}