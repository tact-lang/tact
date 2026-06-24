struct InnerA { a: Int }
struct InnerB { b: InnerA }
struct InnerC { c: InnerB }
struct InnerD { d: InnerC }
struct InnerE { e: InnerD }

contract DeepOptMix {
    data: InnerE?;

    init() {
        self.data = null;
    }
}