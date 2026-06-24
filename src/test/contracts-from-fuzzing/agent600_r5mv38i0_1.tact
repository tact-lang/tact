contract SingleIntField {
    myNumber: Int = 42;

    receive() {
        let x = self.myNumber;
    }
}