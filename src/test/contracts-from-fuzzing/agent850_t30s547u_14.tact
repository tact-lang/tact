struct HasRemaining {
    prefix: Int as uint32;
    suffix: Cell as remaining;
}

contract RemainingInStruct {
    data: HasRemaining;
    
    init() {
        self.data = HasRemaining{
            prefix: 7, suffix: emptyCell(),
        };
    }
}