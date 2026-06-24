struct Deep3 {
    deepVal: Int;
}

struct Deep2 {
    deeper: Deep3;
}

struct Deep1 {
    innerDeep: Deep2;
}

contract TestContract {
    deepField: Deep1;

    init() {
        self.deepField = Deep1{
            innerDeep: Deep2{
                deeper: Deep3{
                    deepVal: 777
                }
            }
        };
    }
}