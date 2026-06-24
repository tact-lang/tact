struct ChainOptionals {
    first: Int?;
    second: Int?;
    third: Int?;
}

contract ChainOpt {
    vals: ChainOptionals;

    init() {
        self.vals = ChainOptionals{
            first:null, second: null, third: null
        };
    }
}