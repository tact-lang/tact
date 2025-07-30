struct Base {
    a: Int;
    b: Bool;
    c: String;
}

struct HasBase {
    base: Base;
    extra: Int;
}

contract NestedBase {
    rec: HasBase;

    init() {
        self.rec = HasBase{
            base: Base{a:1,b:true,c:"hey"},
            extra: 42,
        };
    }
}
