struct ComplexLevel3 {
    a: Int?;
    b: Bool?;
}

struct ComplexLevel2 {
    x: ComplexLevel3?;
    y: String?;
}

struct ComplexLevel1 {
    nested1: ComplexLevel2?;
    nested2: ComplexLevel2?;
}

contract ComplexContract {
    data: ComplexLevel1?;
}