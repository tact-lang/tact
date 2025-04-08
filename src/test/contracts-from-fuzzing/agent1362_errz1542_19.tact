struct OptDeep2 {
    level2: OptDeep1?;
}

struct OptDeep1 {
    level1: Int?;
}

contract OptDeepContract {
    field: OptDeep2 = OptDeep2{ level2: null };
}