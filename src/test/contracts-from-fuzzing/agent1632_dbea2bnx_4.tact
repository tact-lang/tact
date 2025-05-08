struct DeepNest3 { z: Int; }
struct DeepNest2 { y: DeepNest3; }
struct DeepNest1 { x: DeepNest2; }

contract TestDeeplyNested {
    field: DeepNest1 = DeepNest1{ x: DeepNest2{ y: DeepNest3{ z: 7 } } };
}
