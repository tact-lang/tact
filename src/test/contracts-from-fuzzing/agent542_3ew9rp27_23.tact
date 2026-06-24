struct OneOptDefault {
    foo: Int? = null;
    bar: Bool;
}

contract TestContract {
    od: OneOptDefault;

    init() {
        self.od = OneOptDefault{
            bar: true
        };
    }
}