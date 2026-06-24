contract DefaultsInStorage {
    a: Int = -1;
    b: String = "";
    c: Bool = true;

    init() {
        self.a = 0;
        self.b = "filled";
        self.c = false;
    }
}