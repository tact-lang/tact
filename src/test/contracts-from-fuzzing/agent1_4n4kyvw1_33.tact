message Booleans {
    b1: Bool;
    b2: Bool;
}

contract Test {
    receive() {
        let m = Booleans{b2:true, b1:false};
    }
}