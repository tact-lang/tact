struct WithOptDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract OptDefaults {
    val: WithOptDefault;

    init() {
        self.val = WithOptDefault{ a:null, b:true };
    }
}