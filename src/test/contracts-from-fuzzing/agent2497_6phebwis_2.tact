struct S1 { a: Int; b: String; c: Bool; d: Slice; e: Cell; f: Address; g: String; h: Bool; i: Int; j: String }

contract ManyFields {
    s: S1;

    init() {
        self.s = S1{
            a: 1,
            b: "b",
            c: true,
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: "c",
            h: false,
            i: 42,
            j: "hello"
        };
    }
}