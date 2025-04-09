struct OptLayer1 {
    val: Int?;
}

struct OptLayer2 {
    inner: OptLayer1?;
}

struct OptLayer3 {
    nest: OptLayer2?;
}

contract NestedOptionals {
    param: OptLayer3;

    init() {
        self.param = OptLayer3{ nest: null };
    }
}