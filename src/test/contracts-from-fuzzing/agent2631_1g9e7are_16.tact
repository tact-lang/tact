contract EnumLike {
    const STATE_0: Int = 0;
    const STATE_1: Int = 1;
    const STATE_2: Int = 2;

    state: Int;

    init() {
        self.state = self.STATE_0;
    }
}