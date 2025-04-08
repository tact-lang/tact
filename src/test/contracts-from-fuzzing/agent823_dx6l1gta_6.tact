struct S4 {
    val: Int;
}

struct S3 {
    opt4: S4?;
}

struct S2 {
    opt3: S3?;
}

struct S1 {
    opt2: S2?;
}

contract VeryDeepOptionals {
    root: S1;

    init() {
        self.root = S1{
            opt2: S2{
                opt3: S3{
                    opt4: S4{
                        val: 777
                    }
                }
            }
        };
    }

    receive() {}
}