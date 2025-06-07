struct DeeplyNested {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
}

struct Top {
    nested: DeeplyNested;
    x: Int;
    y: String;
}

contract MultiLevel {
    data: Top;

    init() {
        self.data = Top{
            nested: DeeplyNested{
                a:1, b:false, c:"hi", d:null
            },
            x:5,
            y:"ok"
        };
    }
}