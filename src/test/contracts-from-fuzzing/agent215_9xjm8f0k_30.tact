struct ManyDefaults {
 a: Int=0; b: Int=1; c: Int=2; d: Int=3; e: Int=4;
 f: Int=5; g: Int=6; h: Int=7; i: Int=8; j: Int=9;
}

contract DefaultsNested {
 x: ManyDefaults = ManyDefaults{};
}