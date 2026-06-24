struct Inner { flag: Bool; }
struct Middle { inner: Inner; num: Int; opt: String?; }
struct Outer { middle: Middle; label: String; }

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{ inner: Inner{flag: true}, num: 17, opt: null },
            label: "deep"
        };
    }
}