struct Deep {
    f1: Int = 1;
    f2: Inner1;
}

struct Inner1 {
    f3: Bool = false;
    f4: Inner2;
}

struct Inner2 {
    f5: Int = 5;
    f6: Inner3;
}

struct Inner3 {
    f7: String = "deep";
}

contract TestContract {
    val: Deep;
    init() {
        self.val = Deep{
            f2: Inner1{
                f4: Inner2{
                    f6: Inner3{},
                },
            },
        };
    }
    receive() {}
}