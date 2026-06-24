struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct HasTwoOptionals {
    first: Inner1?;
    second: Inner2?;
}

contract CrossOptionals {
    field: HasTwoOptionals;

    init() {
        self.field = HasTwoOptionals{
            first: Inner1{a:1},
            second: null,
        };
    }
}
