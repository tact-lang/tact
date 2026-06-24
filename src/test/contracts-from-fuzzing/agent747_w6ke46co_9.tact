contract TestContract {
    optionalNested: Outer?;

    init() {
        self.optionalNested = Outer{
            inn: Inner{
                flag: true
            }
        };
    }
}

struct Outer {
    inn: Inner;
}

struct Inner {
    flag: Bool;
}
