struct OptionalNest {
    innermost: String?;
}

struct Wrapper {
    nested: OptionalNest?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: OptionalNest{
                innermost: "abc"
            }
        };
    }
}