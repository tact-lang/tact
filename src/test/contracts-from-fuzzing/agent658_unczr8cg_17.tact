message(3) M {}

struct Outer {
    msg: M;
}

contract MessageStructField {
    field: Outer;

    init() {
        self.field = Outer{
            msg: M{}
        };
    }
}