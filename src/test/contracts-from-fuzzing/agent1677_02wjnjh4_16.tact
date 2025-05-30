struct Compose {
    lvl1: ComposeInner;
}

struct ComposeInner {
    lvl2a: ComposeLeaf;
    lvl2b: ComposeLeaf;
}

struct ComposeLeaf {
    x: Int;
    y: Bool;
    txt: String;
}

contract TestCompose {
    c: Compose = Compose{
        lvl1: ComposeInner{
            lvl2a: ComposeLeaf{ x:1, y:true, txt:"A" },
            lvl2b: ComposeLeaf{ x:2, y:false, txt:"B" }
        }
    };

    init() {
        self.c.lvl1.lvl2a.x = 99;
    }
}
