contract TestMapMissing {
    data: map<Int, Int>;

    receive() {}

    get fun getMissing(): Int? {
        return self.data.get(1000);
    }
}
