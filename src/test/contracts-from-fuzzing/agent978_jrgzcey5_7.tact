// contract with a nested struct with deeply nested optional fields interleaved with non-optional
struct Level1 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    l1: Level1?;
    c: String;
    d: Int?;
}

struct Level3 {
    l2: Level2;
    e: Bool;
    f: Address?;
}

contract DeepMixContract {
    l3: Level3;

    init() {
        self.l3 = Level3{
            l2: Level2{
                l1: null,
                c: "test",
                d: null
            },
            e: true,
            f: null
        };
    }
}