struct Combo {
    normalInt: Int;
    optInt: Int?;
    u4: Int as uint4;
    optU4: Int?;
}

contract Test15 {
    data: Combo;

    init() {
        self.data = Combo{
            normalInt: 5,
            optInt: null,
            u4: 9,
            optU4: null
        };
    }
}
