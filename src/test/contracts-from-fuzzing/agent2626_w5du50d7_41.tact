struct Deeper {
    i: Int?;
    b: Bool?;
}

struct Base {
    x: Deeper;
    y: Deeper;
}

contract MultipleOptionLayers {
    val: Base;

    init() {
        self.val = Base{
            x: Deeper{i:null,b:true},
            y: Deeper{i:42,b:null}
        };
    }
}