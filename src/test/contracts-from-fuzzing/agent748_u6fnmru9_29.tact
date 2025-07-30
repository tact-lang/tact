// Struct with String, Address, Bool
struct Flat {
    s: String;
    a: Address;
    b: Bool;
}
contract FlatContract {
    p: Flat;

    init() {
        self.p = Flat{
            s: "hello",
            a: myAddress(),
            b: true
        };
    }
}