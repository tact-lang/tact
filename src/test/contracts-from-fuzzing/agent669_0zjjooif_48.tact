struct ASub {
    x: Int;
    y: Bool;
}

struct BSub {
    z: String?;
}

struct ComboNested {
    a: ASub;
    b: BSub;
}

contract NestedCombos {
    val: ComboNested;

    init() {
        self.val = ComboNested{
            a: ASub{ x:1, y:true },
            b: BSub{ z:null }
        };
    }
}