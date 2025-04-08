struct Chain1 { v: Int; }
struct Chain2 { ch1: Chain1; }
struct Chain3 { ch2: Chain2; }

contract MixOpt {
    field: Chain3?;

    init() {
        self.field = null;
    }
}