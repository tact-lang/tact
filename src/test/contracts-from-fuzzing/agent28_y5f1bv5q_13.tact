struct Inner0{
    f0: Int?;
}

struct Inner1{
    f1: Inner0?;
}

struct Inner2{
    f2: Inner1?;
}

struct Inner3{
    f3: Inner2?;
}

contract Test {
    deeplyNested: Inner3;

    init() {
        self.deeplyNested = Inner3{
            f3: Inner2{
                f2: Inner1{
                    f1: Inner0{
                        f0: null
                    }
                }
            }
        };
    }
}