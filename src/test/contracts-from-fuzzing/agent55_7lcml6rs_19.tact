message HasBool {
    f: Bool;
}

contract TestContract {
    receive(msg: HasBool) {
        if (msg.f) {
            // do
        }
    }
}