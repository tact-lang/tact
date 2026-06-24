struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: SubOpt?;
}

struct SubOpt {
    x: Int?;
    y: Bool;
}

contract OptTypes {
    store: DeeplyOptional;

    init() {
        self.store = DeeplyOptional{
            a: 1,
            b: null,
            c: SubOpt{ x: null, y: false }
        };
    }
}