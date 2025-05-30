struct ReversedOrder {
    e: Int;
    d: Bool;
    c: Slice;
    b: String;
    a: Address;
}

contract ReverseOrderTest {
    big: ReversedOrder;

    init() {
        self.big = ReversedOrder{
            e:1, d:true, c:emptyCell().asSlice(), b:"hello", a:myAddress()
        };
    }
}