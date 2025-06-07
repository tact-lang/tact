struct DefaultsDeep {
    a: Int = 1;
    b: InnerDefault;
}

struct InnerDefault {
    c: Int = 2;
    d: Bool = false;
}

contract TestContract {
    val: DefaultsDeep;

    init() {
        self.val = DefaultsDeep{
            b: InnerDefault{}
        };
    }
}