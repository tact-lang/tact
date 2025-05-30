// deep nested, optional, with defaults combined
struct In0 { x:Int?=null; }
struct In1 { x:In0?=null; }
struct In2 { x:In1?=null; }
struct In3 { x:In2?=null; }

contract DeepOptDef {
    root: In3? = null;

    init() {
        self.root = null;
    }
}