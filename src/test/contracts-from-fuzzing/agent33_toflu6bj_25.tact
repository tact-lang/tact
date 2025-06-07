struct Deep {
    val: Int;
}

struct Outer {
    val: Int;
    opt: Deep?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: 1,
            opt: Deep{ val: 42 }
        };
    }
}