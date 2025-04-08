struct TailOptional {
    foo: Int?;
    bar: Bool?;
    baz: Slice as remaining;
}

contract ComplexTailOpt {
    data: TailOptional;

    init() {
        self.data = TailOptional{foo:5, bar:true, baz:emptyCell().asSlice()};
    }
}