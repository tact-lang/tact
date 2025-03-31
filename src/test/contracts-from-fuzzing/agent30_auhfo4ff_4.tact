contract TestContract {
    receive() {
        let s: String = "Hello \"world\" \\ test \n new line";
        let dummy: Slice = s.asSlice();
    }
}
