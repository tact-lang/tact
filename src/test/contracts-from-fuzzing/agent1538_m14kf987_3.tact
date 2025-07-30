struct Deep3 {
    z: Int;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract TestContract {
    deepField: Deep1;

    init() {
        self.deepField = Deep1{
            x: Deep2{
                y: Deep3{ z: 42 }
            }
        };
    }
}