struct OptAndDefault {
    a: Int?;
    b: Int = 5;
}
contract OptionalsDefaults {
    f: OptAndDefault;
    init() {
        self.f = OptAndDefault{ a:null };
    }
}