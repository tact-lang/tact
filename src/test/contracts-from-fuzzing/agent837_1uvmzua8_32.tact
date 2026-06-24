struct Outer { a: Int; b: Bool; }

contract ContractA {
    x: Outer;
    y: Outer;
    z: Outer;
    init() {
        self.x = Outer{ a:1, b:true };
        self.y = Outer{ a:2, b:false };
        self.z = Outer{ a:3, b:true };
    }
}