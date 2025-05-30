struct Level3 {
    x: Int?;
    y: String;
    z: Bool?;  
}

struct Level2 {
    a: Int;
    b: Level3;
    c: String?;
}

struct Level1 {
    foo: Bool;
    bar: Level2?;
    baz: Address;
}

contract DeepWideOpts {
    data: Level1;

    init() {
        self.data = Level1{
            foo: true,
            bar: Level2{
                a: 42,
                b: Level3{
                    x: null,
                    y: "hello",
                    z: true
                },
                c: null
            },
            baz: myAddress()
        };
    }
}