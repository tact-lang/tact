// test nested struct with optional nested inside, parameterized
struct SInner { x: Int; y: Bool; }
struct SOuter { nested: SInner?; }

contract TestContract(
    value: SOuter
) {}