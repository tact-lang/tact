// Field reordering with explicit defaults
struct ReorderDefaults {
    x: Int = 2;
    y: Bool = false;
    z: String = "hey";
}

contract ReorderDefaultsTest {
    stuff: ReorderDefaults;

    init() {
        self.stuff = ReorderDefaults{
            z:"zval", y:true, x:5
        };
    }
}