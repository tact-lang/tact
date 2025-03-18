contract ThrowOnlyFallbackEmpty {
    receive(_: Slice) {throw(0xffff);}
}

contract ThrowOnlyFallbackText {
    receive("text") {}

    receive(_: Slice) {throw(0xffff);}
}

message SomeName {}

contract ThrowOnlyFallbackBinary {
    receive(msg: SomeName) {}

    receive(_: Slice) {throw(0xffff);}
}

contract ThrowOnlyFallbackMixed {
    receive("text") {}

    receive(msg: SomeName) {}

    receive(msg: String) {}

    receive(_: Slice) {throw(0xffff);}
}

contract NotThrowOnlyFallback {
    receive(msg: SomeName) {}

    receive(_: Slice) {
        if (myBalance() > 0) {
            return;
        }
        throw(0xffff);
    }
}