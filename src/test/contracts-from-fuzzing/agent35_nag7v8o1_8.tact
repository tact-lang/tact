contract TestGetterMutation {
    v: Int = 0;

    receive() {}

    get fun getMutatedV(): Int {
        self.v += 1;
        return self.v;
    }
}
