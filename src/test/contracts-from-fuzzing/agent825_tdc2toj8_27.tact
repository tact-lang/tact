// multiple nested optionals with defaults
struct DefInner {
    x:Int?=null;
    y:Bool?=null;
}

struct DefMid {
    inner:DefInner?=null;
    s:String?=null;
}

contract Defnested {
    d: DefMid? = null;

    init() {
        self.d = null;
    }
}