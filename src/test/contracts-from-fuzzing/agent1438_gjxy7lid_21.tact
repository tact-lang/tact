struct Level3 {
    a: Address;
    b: Address?;
}

struct Level2 {
    inner: Level3;
    c: Bool;
}

struct Level1 {
    nested: Level2;
    d: Int?;
}

contract AddressDeepNest {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{
                inner: Level3{
                    a: myAddress(),
                    b: null,
                },
                c: true,
            },
            d: null,
        };
    }
}