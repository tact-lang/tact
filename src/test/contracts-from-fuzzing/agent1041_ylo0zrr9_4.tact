struct OptionalStruct {
    val: Int;
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Int;
}

contract OptStructContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: 42,
            s: null
        };
    }
}
