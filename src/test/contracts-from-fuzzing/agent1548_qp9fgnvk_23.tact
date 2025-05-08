// optional fields mixed with defaults
struct Combo {
    a:Int?;
    b:Bool = true;
    c:String?;
    d:Int = 42;
}

contract Test {
    val: Combo;

    init() {
        self.val = Combo{
            a: null,
            c: null
        };
    }
}