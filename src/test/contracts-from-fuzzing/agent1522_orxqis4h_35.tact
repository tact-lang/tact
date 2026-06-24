struct InnerMost {
    foo: Int;
}

struct InnerOpt {
    a: InnerMost?;
    b: Int;
}

struct LevelTwo {
    opt: InnerOpt;
}

struct OuterOptional {
    lvl2: LevelTwo?;
    x: Int;
}

contract NullStructDeep {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            lvl2: null,
            x: 0,
        };
    }
    receive() {
        let _ = self.data;
    }
}