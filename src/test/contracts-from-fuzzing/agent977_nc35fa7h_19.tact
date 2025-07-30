// optional struct inside struct field in param mode
struct Inner {
    val: Int;
}

struct Container {
    optInner: Inner?;
    flag: Bool;
}

contract ParNestOpt(
    data: Container,
    num: Int
) {}