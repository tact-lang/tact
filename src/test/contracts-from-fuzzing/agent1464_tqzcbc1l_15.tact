struct Outer {
    a: InnerLevel;
    b: InnerLevel;
}

struct InnerLevel {
    x: Int;
    y: Bool;
    z: Int?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            a: InnerLevel{ x:1, y:true, z:null },
            b: InnerLevel{ x:2, y:false, z:null }
        };
    }
}