struct MultiType {
    i: Int;
    b: Bool;
    c: Cell;
    s: String;
    a: Address;
}

contract MixedTypesContract {
    foo: MultiType;

    init() {
        self.foo = MultiType{
            i:42,
            b:true,
            c:emptyCell(),
            s:"hello",
            a:myAddress()
        };
    }
}