struct PrimOptionals {
    optInt: Int?;
    optBool: Bool?;
    someInt: Int;
    someBool: Bool;
}

contract PrimOptContract {
    varz: PrimOptionals;

    init() {
        self.varz = PrimOptionals{ optInt: null, optBool: null, someInt: 123, someBool: true };
    }
}