struct Inner {
    val: Int?;
}

struct Middle {
    val: Inner?;
}

struct Outer {
    middle1: Middle?;
    middle2: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle1: null,
            middle2: Middle{
                val: Inner{ val: 42 }
            }
        };
    }
}
