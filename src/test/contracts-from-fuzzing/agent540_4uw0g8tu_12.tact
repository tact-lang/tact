struct InnerMost { val: Int?; }
struct Inner { nested: InnerMost; }
struct Middle { layer: Inner; }
struct Outer { shell: Middle; }

contract OptionalDeep {
    data: Outer;

    init() {
        self.data = Outer{
            shell: Middle{
                layer: Inner{
                    nested: InnerMost{ val: null }
                }
            }
        };
    }
}