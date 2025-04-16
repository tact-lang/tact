struct Inner {
    a: Int?;
}

contract Test38 {
    superNested: Inner?;

    init() {
        self.superNested = Inner{a: null};
    }

    get fun foo(): Int? {
        if (self.superNested != null) {
            return self.superNested!!.a;
        } else {
            return null;
        }
    }
}