struct ChainStruct {
    first: Int;
    second: Int;
    third: Int;
    fourth: Int;
}

contract TestContract {
    chain: ChainStruct;

    init() {
        self.chain = ChainStruct{
            first:1, second:2, third:3, fourth:4,
        };
    }
}