contract TestContract {
    simpleInt: Int;

    init() {
        self.simpleInt = 1;
    }

    receive() {
        let x = self.simpleInt;
    }
}