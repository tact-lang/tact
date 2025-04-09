struct MultiNested {
    a: Int;
    inner1: Inner1;
    inner2: Inner2;
}
struct Inner1 {
    s: String;
    flag: Bool;
}
struct Inner2 {
    addr: Address;
    num: Int;
}
contract Test {
    field: MultiNested;

    init() {
        self.field = MultiNested{
            a: 7,
            inner1: Inner1{ s: "foo", flag: true },
            inner2: Inner2{ addr: myAddress(), num: 99 }
        };
    }
}