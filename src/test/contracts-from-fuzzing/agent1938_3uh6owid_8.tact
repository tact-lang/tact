struct Inner1 { x: Int; }
struct Inner2 { y: Inner1?; }
struct Inner3 { z: Inner2?; }

contract DeepOptionalWrap {
    data: Inner3?;

    init() {
        self.data = null;
    }
}