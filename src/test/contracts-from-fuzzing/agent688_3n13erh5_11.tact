struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Top {
    a: NestedOptional;
    b: NestedOptional;
    c: NestedOptional;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top{
            a: NestedOptional{ x:null, y:null, z:null },
            b: NestedOptional{ x:1, y:true, z:"x" },
            c: NestedOptional{ x:-1, y:false, z:"y" },
        };
    }
}