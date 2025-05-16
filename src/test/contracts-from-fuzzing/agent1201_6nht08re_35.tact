// Minimal struct with many different primitive types
struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}
contract MixedTest {
    data: Mixed;

    init() {
        self.data = Mixed{
            i:1, b:true, s:"hi", a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice()
        };
    }
}