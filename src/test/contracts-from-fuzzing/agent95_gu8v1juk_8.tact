struct SubStruct {
    val: Int;
    active: Bool?;
}

struct Combo {
    count: Int?;
    name: String?;
    inner: SubStruct?;
}

contract TestContract {
    mixed: Combo?;

    init() {
        self.mixed = Combo{
            count: 10,
            name: "xyz",
            inner: SubStruct{ val: 42, active: null }
        };
    }
}