contract TestStringAsSlice {
    receive() {
        let s = "Hello";
        let sl = s.asSlice();
    }
}