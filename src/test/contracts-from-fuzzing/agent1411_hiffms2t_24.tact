// testing contract parameters deeply nested combination
struct InnerMost { val: Int }
struct Inner { innerMost: InnerMost }
struct Middle { inner: Inner }
struct Outer { middle: Middle }

contract ParamDeep(
    complexParam: Outer,
    id: Int
) {
    receive() {
        let _ = self.complexParam;
        let _ = self.id;
    }
}