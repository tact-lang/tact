contract DefaultsVsNoDefaults {
    a: Int=7;
    b: Int;
    c: String="hello";
    d: String;
    f: Bool=false;
    g: Bool;

    init() {
        self.b=8;
        self.d="world";
        self.g=true;
    }
}