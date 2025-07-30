struct RangedOptionals {
    a: Int? as uint4;
    b: Int? as int8;
    c: Int? as uint32;
}

contract TestContract {
    data: RangedOptionals;

    init() {
        self.data = RangedOptionals{ a: null, b: -10, c: null };
    }
}