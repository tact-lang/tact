struct DeepLast { v: Int; }

struct MidOpt { inner: DeepLast?; }

struct TopOpt { inner: MidOpt?; }

contract MixLegacy {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
    d: Address;
    e: TopOpt;

    init() {
        self.d = myAddress();
        self.e = TopOpt { inner: MidOpt { inner: DeepLast { v: 999 } } };
    }
}