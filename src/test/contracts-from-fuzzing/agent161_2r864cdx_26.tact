struct Sub1 { x: Int; y: Bool; }
struct Sub2 { a: Int?; b: String; }
struct Sub3 { c: Bool; d: String?; }

struct Container {
    f1: Sub1;
    f2: Sub2;
    f3: Sub3;
}

contract MixedNested {
    data: Container;

    init() {
        self.data = Container{
            f1: Sub1{ x:1, y:true },
            f2: Sub2{ a:null, b:"hi" },
            f3: Sub3{ c:false, d:null }
        };
    }

    receive() {}
}