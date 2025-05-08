struct Small {
    ok: Bool;
}

struct WithOptionalField {
    val: Small?;
    str: String;
}

contract TestDeepOptional {
    f: WithOptionalField;

    init() {
        self.f = WithOptionalField{
            val: Small{ ok:true },
            str: "text",
        };
    }
}