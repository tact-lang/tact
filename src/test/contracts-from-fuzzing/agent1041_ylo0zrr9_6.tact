struct DataA {
    a: Int;
    b: Int?;
    c: Int;
}

struct DataB {
    innerA: DataA;
    flag: Bool;
    text: String;
}

contract NestedComplex {
    data: DataB;

    init() {
        self.data = DataB{
            innerA: DataA{ a: 10, b: null, c: 30 },
            flag: true,
            text: "hello"
        };
    }
}
