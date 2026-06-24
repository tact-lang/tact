struct HasTwoOptionals {
    a: Inner?;
    b: Inner?;
}

struct Inner {
    v: Int;
}

contract TwoOptionalsSameType {
    f: HasTwoOptionals;

    init() {
        self.f = HasTwoOptionals{ a:null, b:null };
    }
}