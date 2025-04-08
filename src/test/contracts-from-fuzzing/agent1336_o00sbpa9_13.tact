struct OptionalStruct {
    a: Int;
    b: Bool;
}

struct WrapOpt {
    val: OptionalStruct?;
}

contract OptionalStructInContract {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            val: null
        };
    }

    receive() {
        let _ = self.data.val;
    }
}