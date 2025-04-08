struct Foo { a: Int; b: Bool; c: String; d: Cell; e: Slice; }

contract MixedTypes {
    data: Foo;

    init() {
        self.data = Foo{
            a: 12,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}