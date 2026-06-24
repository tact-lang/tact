struct SLevel3 {
    z: Int;
}
struct SLevel2 {
    y: SLevel3;
}
struct SLevel1 {
    x: SLevel2;
}

contract DeepNest {
    val: SLevel1;

    init() {
        self.val = SLevel1{ x: SLevel2{ y: SLevel3{ z: 42 } } };
    }
}