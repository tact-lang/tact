struct StructA { x: Int }
struct StructB { y: Bool }

contract Test36 {
    sa: StructA?;
    sb: StructB?;

    init() {
        self.sa = null;
        self.sb = StructB{ y:false };
    }
}
