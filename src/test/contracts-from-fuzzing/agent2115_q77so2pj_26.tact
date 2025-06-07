// nested contract parameters of optional struct
struct Conf {
    id: Int;
    name: String;
}

contract WrapParams(
    conf: Conf?,
    desc: String?,
    amount: Int as coins,
) {}