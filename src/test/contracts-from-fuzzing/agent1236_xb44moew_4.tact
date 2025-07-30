struct Foo { a: Int; b: Bool; c: Cell; d: String; e: Slice; f: Address; g: Int?; h: Bool?; i: Address?; }

contract Test {
    many: Foo;

    init() {
        self.many = Foo{
            a: 1,
            b: true,
            c: emptyCell(),
            d: "abc",
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 2,
            h: false,
            i: null
        };
    }
}