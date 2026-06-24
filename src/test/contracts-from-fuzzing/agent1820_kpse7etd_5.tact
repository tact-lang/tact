struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{
            inner: Inner{
                val: 10,
                flag: false,
            },
        };
    }
}