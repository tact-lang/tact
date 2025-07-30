struct StructA { x: Int; }
struct StructB { y: Bool; }
struct StructC { z: String; }

contract NestedOptionals {
    optA: StructA? = null;
    optB: StructB? = null;
    optC: StructC? = null;

    init() {}
}