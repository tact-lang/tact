struct DeepNesting4 {
    val: Int = 4;
}

struct DeepNesting3 {
    next: DeepNesting4 = DeepNesting4{};
}

struct DeepNesting2 {
    next: DeepNesting3 = DeepNesting3{};
}

struct DeepNesting1 {
    next: DeepNesting2 = DeepNesting2{};
}

contract NestTester {
    field: DeepNesting1 = DeepNesting1{};
    init() {}
}