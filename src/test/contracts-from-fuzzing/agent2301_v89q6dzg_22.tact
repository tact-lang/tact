struct OnlyRemaining {
    rem: Cell as remaining;
}

contract JustRemaining {
    state: OnlyRemaining;

    init() {
        self.state = OnlyRemaining { rem: emptyCell() };
    }
}