struct SA { foo: Int }
struct SB { bar: SA }

contract Semicolons {
    pair: SB;
    init() {
        self.pair = SB{ bar: SA{ foo: 321 }};
    }
}