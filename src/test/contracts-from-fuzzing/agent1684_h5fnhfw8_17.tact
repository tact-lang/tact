struct InnerMost { z: Int?; }
struct Inner { y: Int; im: InnerMost; }
struct Outer { x: Int?; inn: Inner; }

contract DeepNestedOptionalInit {
    s: Outer;

    init() {
        self.s = Outer{
            x: null,
            inn: Inner{
                y: 5,
                im: InnerMost{ z: 10 }
            }
        };
    }
}