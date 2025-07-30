// optional param nested in optional struct param w/ deep nested in param
struct OINNER3 {
    foo: Int?;
}

struct OINNER2 {
    o3: OINNER3?;
}

struct OINNER1 {
    o2: OINNER2?;
}

contract ParamDeeperOpt(
    value: OINNER1?
) {}