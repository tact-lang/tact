struct NestingLevel1 {
    x: Int;
}

struct NestingLevel2 {
    l1: NestingLevel1;
}

struct NestingLevel3 {
    l2: NestingLevel2;
}

struct NestingLevel4 {
    l3: NestingLevel3;
}

contract ParamsNested(
    val: NestingLevel4,
) {
}