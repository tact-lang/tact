struct Bar { x: Int; y: Bool; z: Int?; }
struct Foo { alpha: Bar; beta: Bar; gamma: Bar; }

contract MultiLayer {
    s1: Foo;
    s2: Foo;

    init() {
        self.s1 = Foo{
            alpha: Bar{ x:1, y:true, z:null },
            beta: Bar{ x:2, y:false, z:3 },
            gamma: Bar{ x:4, y:true, z:null }
        };
        self.s2 = Foo{
            alpha: Bar{ x:5, y:true, z:6 },
            beta: Bar{ x:7, y:false, z:null },
            gamma: Bar{ x:8, y:true, z:9 }
        };
    }
}
