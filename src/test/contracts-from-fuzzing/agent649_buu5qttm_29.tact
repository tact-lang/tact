struct JustString {
    s: String;
}

contract SingleStruct {
    j: JustString = JustString{s:"text"};
    receive() {
        let _ = self.j.s;
    }
}