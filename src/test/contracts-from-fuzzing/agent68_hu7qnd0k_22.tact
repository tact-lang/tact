struct Tiny {
    x: Int;
    y: Bool;
}

struct ContainTiny {
    label: String;
    inner: Tiny;
}

contract ParamsDeep(
    info: ContainTiny
) {}
