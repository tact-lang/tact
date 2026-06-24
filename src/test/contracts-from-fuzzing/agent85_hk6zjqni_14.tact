contract TestGetterMutation {
    v: Int = 5;

    receive() {}

    get fun mutateGetter(): Int {
        self.v += 1;
        return self.v;
    }
}
