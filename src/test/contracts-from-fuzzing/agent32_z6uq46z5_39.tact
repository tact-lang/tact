struct OptionalLayer {
    inn: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptLayer {
    o: OptionalLayer;

    init() {
        self.o = OptionalLayer{ inn: null };
    }
}
