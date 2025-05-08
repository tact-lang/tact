struct FlattenNested {
    nested: Nested;
    direct: Int;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract FlattenTest {
    val: FlattenNested;

    init() {
        self.val = FlattenNested{
            nested: Nested{x:7,y:true},
            direct: 42
        };
    }
}
