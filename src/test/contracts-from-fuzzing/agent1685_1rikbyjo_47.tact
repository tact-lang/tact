struct TopStruct {
    nested1: Int;
    nested2: Int = 42;
}

contract DefaultsMix {
    hold: TopStruct;
    init() {
        self.hold = TopStruct{
            nested1: 7
        };
    }
}
