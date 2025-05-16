// optional struct with some default values and nulls in init
struct OptDef {
    a:Int? = null;
    b:Bool? = null;
    c:String? = null;
}

contract OptDefaults {
    persist: OptDef;

    init() {
        self.persist = OptDef{};
    }
}