struct Inner { f: Int }

contract OptionalStruct {
    a: Inner?;

    init() {
        self.a = Inner{ f: 42 };
    }
}