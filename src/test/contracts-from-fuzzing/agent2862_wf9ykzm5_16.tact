struct SLevel3 {
    x: Int?;
}

struct SLevel2 {
    mid: SLevel3;
}

struct SLevel1 {
    top: SLevel2;
}

contract OptDeepNest {
    deep: SLevel1 = SLevel1{
        top: SLevel2{
            mid: SLevel3{ x: null },
        },
    };
}