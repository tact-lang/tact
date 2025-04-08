struct SerialInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int as int256;
}

contract SerialIntsContract {
    data: SerialInts;

    init() {
        self.data = SerialInts{
            a:127, b:32767, c:2147483647, d:9223372036854775807,
            e:170141183460469231731687303715884105727,
            f:115792089237316195423570985008687907853269984665640564039457584007913129639935
        };
    }
}