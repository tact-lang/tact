struct Level2 {
    a: Int;
    sub: String;
}

struct Level1 {
    foo: Level2;
    bar: Bool;
    opt: Int?;
}

struct Root {
    l1: Level1;
    txt: String;
}

contract MultiNest {
    payload: Root;

    init() {
        self.payload = Root{
            l1: Level1{
                foo: Level2{
                    a: 100,
                    sub: "nested"
                },
                bar: true,
                opt: null
            },
            txt: "root"
        };
    }
}