struct Layer1 {
    num: Int;
    flag: Bool;
}

struct Layer2 {
    l1_1: Layer1;
    l1_2: Layer1;
}

contract ParamsNested(
    param: Layer2,
) {
}