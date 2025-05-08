struct BigNest1 {
    x: Int;
    y: Int;
    child: BigNest2;
}

struct BigNest2 {
    flag: Bool?;
    str: String;
    child: BigNest3;
}

struct BigNest3 {
    a: String?;
    b: Bool;
    c: Int?;
}

contract DeepBigNestPersist {
    data: BigNest1;
    init() {
        self.data = BigNest1{
            x: 7,
            y: 9,
            child: BigNest2{
                flag: null,
                str: "hello",
                child: BigNest3{
                    a: null,
                    b: true,
                    c: null,
                },
            },
        };
    }
}