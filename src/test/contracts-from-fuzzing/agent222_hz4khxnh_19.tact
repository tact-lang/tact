contract OptsWithoutInit {
    a: Int?;
    b: Bool?;
    c: String?;

    receive() {
        self.a = null;
        self.b = true;
        self.c = "abc";
    }
}