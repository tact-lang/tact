struct RSA {
    p: Int;
    q: Int;
}

struct Crypto {
    rsaKey: RSA;
    pubKey: String;
    optKey: String?;
}

contract NestedOptionalAtEnd {
    params: Crypto;

    init() {
        self.params = Crypto{
            rsaKey: RSA{ p: 3, q: 7 },
            pubKey: "key",
            optKey: null
        };
    }
}