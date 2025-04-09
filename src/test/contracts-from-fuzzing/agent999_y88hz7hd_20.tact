struct StringNested {
    part1: String;
    part2: String;
    optional: String?;
}

contract StringsDeep {
    s: StringNested;

    init() {
        self.s = StringNested{
            part1: "hello",
            part2: "world",
            optional: null
        };
    }
}