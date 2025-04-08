struct OuterMost {
    mid: Middle?;
}

struct Middle {
    inner: InnerMost?;
}

struct InnerMost {
    val: Int?;
}

contract DeepOptionNullable {
    top: OuterMost;

    init() {
        self.top = OuterMost{
            mid: Middle{
                inner: InnerMost{
                    val: null
                }
            }
        };
    }
}