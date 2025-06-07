struct Deep {
    nest1: Deep1;
}

struct Deep1 {
    nest2: Deep2;
}

struct Deep2 {
    nest3: Deep3;
}

struct Deep3 {
    val: Int;
}

contract NestedFields {
    val: Deep;

    init() {
        self.val = Deep{
            nest1: Deep1{
                nest2: Deep2{
                    nest3: Deep3{
                        val: 99
                    }
                }
            }
        };
    }
}
