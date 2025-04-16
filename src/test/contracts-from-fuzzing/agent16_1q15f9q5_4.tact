contract MapFields {
    a: map<Int, Int>;
    b: map<Address, Bool>;

    init() {
        self.a = emptyMap();
        self.b = emptyMap();
    }
}
