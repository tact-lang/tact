struct Inner1 { x: Int?; }
struct Inner2 { y: Inner1?; }
struct Inner3 { z: Inner2?; }

contract DeepNullableStructs {
    val: Inner3?;

    init() {
        self.val = null;
    }
}