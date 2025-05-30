struct WrappedOptionals {
    si: SOptInt;
    sb: SOptBool;
}

struct SOptInt {
    x: Int?;
}

struct SOptBool {
    b: Bool?;
}

contract Test25 {
    val: WrappedOptionals;

    init() {
        self.val = WrappedOptionals{
            si: SOptInt{ x: null },
            sb: SOptBool{ b: null }
        };
    }
}