struct UnusualOrder {
    x: Int;
    y: Bool;
    z: Int?;
    k: Bool?;
}

contract UnusualOrderContract {
    field: UnusualOrder;

    init() {
        self.field = UnusualOrder{
            x:1,
            y:true,
            z:null,
            k:null
        };
    }
}