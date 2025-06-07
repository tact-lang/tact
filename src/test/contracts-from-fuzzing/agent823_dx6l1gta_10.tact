struct WeirdInts {
    a: Int as uint3;
    b: Int as int6;
    c: Int as uint17;
    d: Int as int8;
}

contract WeirdIntsStorage {
    wi: WeirdInts;

    init() {
        self.wi = WeirdInts{
            a: 7,    // max for uint3
            b: -32,  // min for int6
            c: 100000,
            d: 127   // max for int8
        };
    }

    receive() {}
}