struct Level2 {
    a: Int;
    b: String;
    opt: Bool?;
}

struct Level1 {
    l2: Level2?;
}

contract OptInsideOpt {
    data: Level1;

    init() {
        self.data = Level1{ l2:null };
    }
}