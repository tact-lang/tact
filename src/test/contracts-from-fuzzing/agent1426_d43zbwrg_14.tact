struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
}

contract DefaultsContract {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{
            c: null
        };
    }
}