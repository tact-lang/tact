message Msg1 {
    v: Int;
}

contract TestContract {
    m: Msg1;

    init() {
        self.m = Msg1{v: 99};
    }
}