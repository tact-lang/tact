struct OptLevel3 { z: Int?; }

struct OptLevel2 { y: Int?; inner: OptLevel3?; }

struct NestedOptional { x: Int; nest: OptLevel2?; }

contract OptNestedTest {
    val: NestedOptional;
    init() {
        self.val = NestedOptional{
            x: 5,
            nest: OptLevel2{
                y: null,
                inner: null
            }
        };
    }
}