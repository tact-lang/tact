struct OptionalInner {
    value: Int?;
}

struct Container {
    val: OptionalInner?;
}

contract Test {
    c: Container = Container{
        val: null
    };

    init() {}
}