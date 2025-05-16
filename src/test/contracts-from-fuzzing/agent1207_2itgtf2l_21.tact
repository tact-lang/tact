struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Level2 {
    opt: OptionalDeep?;
    other: Int;
}

struct Level1 {
    inner: Level2;
    flag: Bool;
}

contract OptionalDeepChain {
    val: Level1?;

    init() {
        self.val = Level1{
            inner: Level2{
                opt: OptionalDeep{
                    a:null, b:null, c:null
                },
                other: 5
            },
            flag: true
        };
    }
}