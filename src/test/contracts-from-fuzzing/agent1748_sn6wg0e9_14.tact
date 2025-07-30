struct DeeplyOptional {
    level1: Int?;
    level2: StructOpt?
}

struct StructOpt {
    x: Int?;
    y: Int?;
}

contract TestContract {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            level1: null,
            level2: StructOpt{ x: null, y: 100 }
        };
    }
}