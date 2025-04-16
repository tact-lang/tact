message(0x21) Special { foo: Int }

struct WrapMe {
    thing: Special? = Special{ foo: 42 };
}

contract TestContract {
    wrapped: WrapMe;

    init() {
        self.wrapped = WrapMe{};
    }
}