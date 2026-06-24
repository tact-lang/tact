struct MultipleOptionals {
    x: Int?;
    y: Int?;
}

struct NestedWithOptionals {
    inner: MultipleOptionals?;
    flag: Bool;
}

contract DeepOptionals {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            inner: null,
            flag: false,
        };
    }

    receive() {
        let _ = self.data;
    }
}