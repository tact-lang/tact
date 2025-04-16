struct Nano {
    val: Int;
}

struct MicroOpt {
    inner: Nano?;
}

struct MacroOpt {
    inner: MicroOpt?;
}

contract TestContract {
    val: MacroOpt;

    init() {
        self.val = MacroOpt{
            inner: null
        };
    }
}