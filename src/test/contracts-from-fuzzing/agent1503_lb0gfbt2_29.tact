// Test struct optional default mixed
struct Mixin {
    a: Int = 5;
    b: String?;
    c: String = "d";
    d: Int?;
    e: Bool = true;
}

contract MixTest {
    val: Mixin;
    init() {
        self.val = Mixin { b: null, d: null };
    }
    receive() {}
}