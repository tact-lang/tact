struct L3 { foo: Int?; }
struct L2 { bar: L3; }
struct L1 { baz: L2?; }

contract DeepOptionals {
    val: L1 = L1{ baz: null };
}