struct DefaultsAndRemaining {
    a: Int = 5;
    rest: Cell as remaining;
}

contract DefaultRemainContract {
    state: DefaultsAndRemaining;
    init() {
        self.state = DefaultsAndRemaining {
            rest: emptyCell() 
        };
    }
}