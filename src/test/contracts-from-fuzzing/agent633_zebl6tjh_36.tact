struct IntNullable {
    a: Int?;
    b: Int? = null;
    c: Int?;
}

contract IntNullHolder {
    val: IntNullable;

    init() {
        self.val = IntNullable{
            a: null,
            b: null,
            c: null
        };
    }
}