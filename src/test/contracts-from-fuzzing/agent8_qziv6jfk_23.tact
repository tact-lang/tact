struct InnerOpt { value: Int? }

struct OuterOpt { inner: InnerOpt }

contract TestGetterOptional {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt { inner: InnerOpt { value: 123 } };
    }

    receive() {}

    get fun getOuterOpt(): OuterOpt {
        return self.outer;
    }
}
