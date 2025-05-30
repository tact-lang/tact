contract TestMap {
    m: map<Int, Bool>;

    receive() {}

    get fun getMap(): map<Int, Bool> {
        return self.m;
    }
}
