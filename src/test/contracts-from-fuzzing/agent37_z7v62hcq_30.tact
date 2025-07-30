struct InnerA {
    flag: Bool;
    note: String?;
}

struct InnerB {
    val: Int;
    data: String;
}

struct Combined {
    partA: InnerA?;
    partB: InnerB;
    memo: String?;
}

contract Test {
    combined: Combined;
    init() {
        self.combined = Combined{
            partA: null,
            partB: InnerB{val: 777, data: "test"},
            memo: null
        };
    }
}