struct Deep3 {
    z: Int;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract DeepNested {
    field: Deep1;

    init() {
        self.field = Deep1{
            x: Deep2{
                y: Deep3{
                    z: 777
                }
            }
        };
    }
}