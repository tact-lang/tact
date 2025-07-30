// Mix of deep struct and optional plus serialization
struct K1 { a: Int?; }
struct K2 { b: K1?; }
struct K3 { c: K2; }
struct K4 { d: K3?; }

contract MixDeepOpt {
    val: K4;

    init() {
        self.val = K4{
            d: null
        };
    }
}
