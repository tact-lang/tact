contract TestTonFixed {
    one: Int = ton("1");
    pointOne: Int = ton("0.1");
    nano: Int = ton("0.000000001");

    receive() {
        dump(self.one);
        dump(self.pointOne);
        dump(self.nano);
    }
}
