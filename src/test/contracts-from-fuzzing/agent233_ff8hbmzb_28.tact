message(0x42) Em {}

contract OptionalMsg {
    m: Em?;

    receive() {
        let _ = self.m;
    }
}