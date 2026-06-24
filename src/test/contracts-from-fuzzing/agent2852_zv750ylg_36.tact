struct WithDefaults {
    a:Int = 7;
    b:String = "d";
}

contract TestDefaults {
    d:WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}