// Combining optionals and nested struct
struct OptNested { inner: Inner?; }
struct Inner { x: Int?; y: Bool; }

contract OptNestedStructTest {
    s: OptNested;
    init() {
        self.s = OptNested {
            inner: Inner { x:null, y:true }
        };
    }
}