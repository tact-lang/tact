struct Top {
    x: Int;
    y: Middle;
}

struct Middle {
    z: Bottom;
}

struct Bottom {
    a: Int;
    b: Bool;
}

contract MultiNested {
    data: Top;
    
    init() {
        self.data = Top{
            x:1,
            y:Middle{
                z:Bottom{
                    a:5,
                    b:true
                }
            }
        };
    }
}
