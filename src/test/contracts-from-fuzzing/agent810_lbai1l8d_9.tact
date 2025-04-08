struct Sub { foo: Int }

contract MixedNullNonNull {
    mustHave: Sub;
    maybe1: Sub?;
    maybe2: Sub?;
    init() {
        self.mustHave = Sub{ foo: 123 };
        self.maybe1 = null;
        self.maybe2 = null;
    }
}
