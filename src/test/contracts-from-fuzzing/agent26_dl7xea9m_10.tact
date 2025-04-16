struct OptionalContract {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

struct Wrapper {
    val: OptionalContract;
}

contract LayeredOpt {
    inner: Wrapper;

    init() {
        self.inner = Wrapper{
            val: OptionalContract{
                optInt: 123,
                optStr: null,
                optBool: true
            }
        };
    }
}