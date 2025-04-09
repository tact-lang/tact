struct Deepest { d: Int; e: Bool }
struct Inner { c: Int; deepest: Deepest }
struct Middle { b: Int; inner: Inner }
struct Outermost { a: Int; middle: Middle }
contract InlineNest {
    data: Outermost;
    init() {
        self.data = Outermost{
            a: 1,
            middle: Middle{
                b: 2,
                inner: Inner{
                    c: 3,
                    deepest: Deepest{ d: 4, e: true }
                }
            }
        };
    }
}