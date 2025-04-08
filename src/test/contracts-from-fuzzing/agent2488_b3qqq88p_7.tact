struct DataChunk {
    a: Int;
    b: Bool;
    s: String;
}

struct OptionStruct {
    inner: DataChunk?;
}

contract LargeStructTest {
    i1: Int;
    i2: Int as uint8;
    i3: Int as int64;
    b1: Bool;
    s1: String;
    addr: Address;
    opt_inner: OptionStruct?;
    datachunk: DataChunk;

    init() {
        self.i1 = -100_000;
        self.i2 = 255;
        self.i3 = -50000;
        self.b1 = true;
        self.s1 = "hello, tact";
        self.addr = myAddress();
        self.opt_inner = null;
        self.datachunk = DataChunk{ a: 777, b: false, s: "nested" };
    }
}