// Test mixed serialization + nested optional + default values
struct MixAll {
    x: Int as int64 = 5;
    y: Bool? = null;
    z: String? = null;
}

contract MixAllTest {
    data: MixAll?;

    init() {
        self.data = null;
    }
}