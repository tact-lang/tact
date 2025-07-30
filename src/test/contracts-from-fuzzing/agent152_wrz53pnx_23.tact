struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    b: InnerOpt?;
}

contract ChainOptionalTest {
    val: OuterOpt?;

    init() {
        self.val = OuterOpt{ b: null };
    }
}