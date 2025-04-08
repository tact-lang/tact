struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    inside: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inside: Inner{
                val1: 1,
                val2: true,
            },
            flag: false
        };
    }
}