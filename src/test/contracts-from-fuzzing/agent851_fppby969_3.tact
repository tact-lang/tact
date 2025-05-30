struct OptInner { x: Int?; y: Bool?; z: String?; }

struct Middle { a: OptInner; b: OptInner?; }

contract OptionalFieldsTest {
    val: Middle;
    init() {
        self.val = Middle{
            a: OptInner{ x: 10, y: true, z: "hi" },
            b: null
        };
    }
}