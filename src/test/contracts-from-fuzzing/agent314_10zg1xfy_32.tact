// optional struct with several different nested structs
struct Inn1 { a:Int; }
struct Inn2 { b:Bool; }
struct Inn3 { c:String; }

struct SuperOpt {
    x: Inn1?;
    y: Inn2?;
    z: Inn3?;
}

contract NestedManyOptionals {
    s: SuperOpt?;
    init() {
        self.s = null;
    }
}