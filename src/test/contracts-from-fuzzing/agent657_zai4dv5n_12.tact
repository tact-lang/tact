struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost?;
    flag: Bool;
}

struct Outer {
    m: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                nested: null,
                flag: true
            }
        };
    }
}