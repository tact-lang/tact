struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract OptionalNested {
    item: NestedOptional?;
    init() {
        self.item = NestedOptional{x:null,y:true};
    }
}