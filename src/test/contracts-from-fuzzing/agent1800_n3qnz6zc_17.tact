struct OneField { val: Int; }

struct TwoField { a: OneField; b: Int; }

contract ChainedStructs {
    s: TwoField;

    init() {
        self.s = TwoField{
            a: OneField{ val: 123 },
            b: 456
        };
    }
}