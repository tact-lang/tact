struct Compose {
    i: Int;
    s: String;
    b: Bool;
}

struct WithOptionals {
    a: Compose?;
    b: Compose?;
}

contract OptionalStructs {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{ a:null, b:null };
    }
}