struct OptionalInner {
    one: Int?;
    two: Bool?;
    three: String?;
}

struct Container {
    data: OptionalInner?;
    count: Int;
}

contract OptionChain {
    store: Container = Container{
        data: null,
        count: 100
    };

    init() {
        self.store = Container{
            data: OptionalInner{one:1,two:true,three:"hi"},
            count: 200
        };
    }
}