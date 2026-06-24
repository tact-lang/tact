struct OneDeep {
    child: TwoDeep;
}

struct TwoDeep {
    child: ThreeDeep;
}

struct ThreeDeep {
    child: FourDeep;
}

struct FourDeep {
    val: Int;
}

contract FourLevelNest(
    root: OneDeep?,
    flag: Bool,
) {
}