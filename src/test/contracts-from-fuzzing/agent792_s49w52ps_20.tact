struct SerializeStruct {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint128;
    d: Int;
}

contract SerializeField {
    val: SerializeStruct;

    init() {
        self.val = SerializeStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}