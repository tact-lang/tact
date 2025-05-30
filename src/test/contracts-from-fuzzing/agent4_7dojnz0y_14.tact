contract TestAsSlice {
    myString: String = "Hello Tact";

    receive() {
        let s: Slice = self.myString.asSlice();
        dump(s);
    }
}