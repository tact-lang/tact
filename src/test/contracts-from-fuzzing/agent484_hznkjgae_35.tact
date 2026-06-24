struct FailInside { foo: Int }

struct OuterOpt {
    inner: FailInside?;
}

contract GoodBecauseNull {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            inner: null
        };
    }
}