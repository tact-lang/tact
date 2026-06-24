struct SerialMix {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
    e: Int = 123;
    f: String = "h";
}

contract TestContract {
    val: SerialMix;

    init() {
        self.val = SerialMix{ a:7,b:-42,c:11,d:-99,e:456,f:"k" };
    }
}