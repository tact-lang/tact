struct Colors {
    red: Int;
    green: Int;
    blue: Int;
}

contract ColorStore {
    c: Colors;

    init() {
        self.c = Colors{
            red: 255, green: 128, blue: 64
        };
    }
}