contract LazyInit {
    val: Int;
    flag: Bool;
    info: String;

    init() {
        self.val = 100;
        self.flag = false;
        self.info = "Lazy";
    }
}