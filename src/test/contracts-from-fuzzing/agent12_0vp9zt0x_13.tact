contract DefaultStateGetterFixed {
    v: Int = 0;

    receive() {}

    get fun getDefault() : Int {
        return self.v;
    }
}
