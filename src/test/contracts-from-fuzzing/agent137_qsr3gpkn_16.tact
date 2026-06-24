struct Inner1 { z: Int }
struct Inner2 { val: Bool }
struct OuterMany {
    a: Int;
    b: Bool;
    c: Inner1;
    d: Inner2;
    e: String;
    f: Slice;
    g: Cell;
    h: Address;
}

contract CombinedTypesTest {
    state: OuterMany;
    init() {
        self.state = OuterMany{
            a: 5,
            b: true,
            c: Inner1{z:123},
            d: Inner2{val:false},
            e: "hi",
            f: emptyCell().asSlice(),
            g: emptyCell(),
            h: myAddress()
        };
    }
    receive(){}
}