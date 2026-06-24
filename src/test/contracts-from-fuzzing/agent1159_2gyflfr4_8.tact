struct DeepOptional {
    val: Int?;
}

struct Outer {
    deep: DeepOptional?;
}

contract TestContract {
    f: Outer?;

    init() {
        self.f = null;
    }
}