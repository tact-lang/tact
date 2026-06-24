struct A { x: Int; }
struct B { y: Bool; }
struct C {
    a: A;
    b: B;
    opta: A?;
    optb: B?;
}
contract NestOpts {
    val: C;
    init() {
        self.val = C{ a: A{x:1}, b: B{y:true}, opta: null, optb: null };
    }
    receive() {
        self.val = C{ a: A{x:2}, b: B{y:false}, opta: A{x:3}, optb: B{y:true} };
    }
}