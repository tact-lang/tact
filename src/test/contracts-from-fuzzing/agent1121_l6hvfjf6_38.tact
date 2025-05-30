// Top level optional struct inside contract
struct TopOpt {
    val: Int;
}

contract ContractOptStructTop {
    data: TopOpt?;

    init() {
        self.data = null;
    }
}