struct InnerMost {
    val: Int;
}

struct Middle {
    deep: InnerMost?;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                deep: InnerMost{ val: 123 }
            }
        };
    }

    receive() {}
}