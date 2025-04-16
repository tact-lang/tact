struct OptBool {
    val: Bool?;
}

contract OptBoolAssigned {
    f: OptBool;

    init() {
        self.f = OptBool{ val:true };
    }
}