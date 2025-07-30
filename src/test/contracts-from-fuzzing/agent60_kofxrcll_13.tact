contract TestMapReturn {
    m: map<Int, Int>;

    receive() {}

    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
