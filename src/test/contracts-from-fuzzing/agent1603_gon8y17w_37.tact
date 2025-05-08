struct OneLevel {
    a: Int;
}

struct TwoLevel {
    sub: OneLevel;
}

struct ThreeLevel {
    node: TwoLevel;
}

contract MultiLevelParam(
    ml: ThreeLevel
) {
    receive() {}
}