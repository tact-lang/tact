struct InnerOpt { a: Int? }
struct OuterOpt { i: InnerOpt? }

contract Test {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ i: null };
    }
}