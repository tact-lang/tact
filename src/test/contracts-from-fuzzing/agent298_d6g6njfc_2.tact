struct DeepNested {
    d1: Int?;
    d2: Bool?;
    d3: String?;
}

struct MidNested {
    m1: DeepNested?;
    m2: DeepNested?;
}

contract DeepOptionalTest {
    n: MidNested?;
}
