struct NestedField {
    foo: Int;
    opt: Int?;
}

contract PlainAndOptNested {
    x: Int;
    y: NestedField;

    init() {
        self.x = 1;
        self.y = NestedField{ foo:2, opt:null };
    }

    receive() {
        let _=self.y;
    }
}