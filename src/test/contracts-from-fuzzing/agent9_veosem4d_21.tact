struct ReversedOrder {
    z: Int;
    y: Int;
    x: Int;
}

contract ReverseOrderStorage {
    data: ReversedOrder;
    init() {
        self.data = ReversedOrder{
            z:1,y:2,x:3
        };
    }
}