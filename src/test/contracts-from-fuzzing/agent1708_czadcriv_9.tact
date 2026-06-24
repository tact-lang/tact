struct OrderTest {
    int1: Int as int8;
    int2: Int as int16;
    int3: Int as int32;
    int4: Int as int64;
    int5: Int as int128;
    int6: Int;
    bool1: Bool;
    bool2: Bool;
    str: String;
    addr: Address;
}

contract TestContract {
    state: OrderTest;

    init() {
        self.state = OrderTest{
            int1: 1,
            int2: 2,
            int3: 3,
            int4: 4,
            int5: 5,
            int6: 6,
            bool1: true,
            bool2: false,
            str: "hello",
            addr: myAddress()
        };
    }
}