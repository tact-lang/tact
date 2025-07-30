struct TextGroup {
    t1: String;
    t2: String;
    t3: String;
    t4: String;
}

contract MultiStringFields {
    f: TextGroup = TextGroup{
        t1: "a",
        t2: "b",
        t3: "c",
        t4: "d"
    };
    receive() {
        let _ = self.f.t4;
    }
}