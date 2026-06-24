struct Tiny {
    a: Int;
    b: Bool;
}

struct Small {
    x: Tiny;
    y: Tiny;
}

contract TinyNest {
    val: Small;

    init() {
        self.val = Small{
            x: Tiny{a:1,b:true},
            y: Tiny{a:2,b:false}
        };
    }
}