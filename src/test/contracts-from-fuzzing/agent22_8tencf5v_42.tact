// Combination of wide and deep nested composites with multiple optionals
struct Leaf {
    x:Int?;
    y:String?;
    z:Bool?;
}

struct MidL {
    leaf1: Leaf?;
    leaf2: Leaf?;
}

struct MidR {
    leaf3: Leaf?;
    leaf4: Leaf?;
}

struct Top {
    left: MidL?;
    right: MidR?;
    title: String;
}

contract WideDeepMix {
    state: Top;

    init() {
        self.state = Top{
            left:null,right:null,title:"start"
        };
    }
}