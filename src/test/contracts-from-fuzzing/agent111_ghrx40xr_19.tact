// Large mix of persistent primitives and composite fields
struct Inner {
    a: Int; b: Bool; c: String;
}

struct Another {
    d: Address; e: Int?;
}

contract BigMix {
    x: Int;
    y: Bool;
    z: String;
    inner: Inner;
    another: Another;

    init() {
        self.x=1; self.y=false; self.z="Z";
        self.inner = Inner{a:2, b:true, c:"X"};
        self.another = Another{d:myAddress(), e:null};
    }
}