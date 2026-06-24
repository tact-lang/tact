struct Serialized {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257; // explicit default serialization
}

contract TestContract {
    val: Serialized;

    init() {
        self.val = Serialized{
            a: 1,
            b: -1000,
            c: 999999999,
            d: -1,
        };
    }

    receive() {}
}