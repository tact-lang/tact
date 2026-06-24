contract TestGetterIf {
    value: Int = 5;

    receive() {}

    get fun conditional(): Int {
        if (self.value > 3) {
            return 100;
        } else {
            return 200;
        }
    }
}
