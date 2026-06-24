struct DeepNested { i: Int?; b: Bool; }
struct Container { d: DeepNested?; val: Int; }

contract TestContract(
    x: Container,
) {}