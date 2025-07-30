struct Level3 {
    innermost: Int;
}

struct Level2 {
    sub: Level3;
    opt: Bool?;
}

struct Level1 {
    part: Level2;
    flag: Bool;
}

contract TestContract {
    t: Level1;

    init() {
        self.t = Level1{
            part: Level2{
                sub: Level3{ innermost: 999 },
                opt: true,
            },
            flag: false,
        };
    }

    receive() {
        let _ = self.t.part.sub.innermost;
        let _ = self.t.part.opt;
        let _ = self.t.flag;
    }
}