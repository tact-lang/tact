struct MightBe {
    foo: Int = 1;
}

contract OptionalByDefault {
    data: MightBe?;

    // no init()!

    receive() {
        if (self.data != null) {
            let _ = self.data!!;
        }
    }
}