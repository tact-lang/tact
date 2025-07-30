struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedStructTest {
    mixed: MixedTypes;

    init() {
        self.mixed = MixedTypes{ i:42, b:true, s:"test" };
    }
}