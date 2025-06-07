// Struct with nested optional composite that is initialized fully
struct Inner {
    a:Int;
    b:String;
}

struct Outer {
    maybe: Inner?;
    flag: Bool;
}

contract FullAssign {
    st: Outer;

    init() {
        self.st = Outer{
            maybe: Inner{a:7,b:"seven"},
            flag: true
        };
    }
}