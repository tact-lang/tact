struct Deep1 {
    val: Int;
}

struct Deep2 {
    nest1: Deep1;
}

struct Deep3 {
    nest2: Deep2;
}

struct Deep4 {
    nest3: Deep3;
}

contract Test {
    deepField: Deep4;

    init() {
        self.deepField = Deep4{
            nest3: Deep3{
                nest2: Deep2{
                    nest1: Deep1{val: 42},
                },
            },
        };
    }
}