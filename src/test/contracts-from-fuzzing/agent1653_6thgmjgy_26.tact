struct DeepInner {
    val: Int;
}

struct Middle {
    d: DeepInner; // required, `val` required
}

struct Outer {
    m: Middle; // required
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                d: DeepInner{
                    val: 123
                }
            }
        };
    }
}