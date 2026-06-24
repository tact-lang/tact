struct NestedOptional {
    x: Int;
    y: Bool;
}

contract OptWhole {
    nested: NestedOptional?;
    init() {
        self.nested = NestedOptional{x:7, y:true};
    }
}