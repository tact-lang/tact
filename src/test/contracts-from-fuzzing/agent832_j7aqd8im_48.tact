struct ComposeNested {
    a: Int;
    s: String;
    b: Bool;
}

trait ComposedTrait {
    nestedField: ComposeNested;
}

contract ComposedTraitContract with ComposedTrait {
    nestedField: ComposeNested;
    init() {
        self.nestedField = ComposeNested{a:10,s:"hi",b:true};
    }
    receive() {
        let _ = self.nestedField.b;
    }
}