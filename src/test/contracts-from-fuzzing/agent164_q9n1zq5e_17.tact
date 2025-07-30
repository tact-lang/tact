struct Blah {
    flag: Bool;
    big: Int as uint256;
    small: Int as uint8;
}

contract TestContract {
    val: Blah = Blah{ flag:true, big:1, small:255 };

    receive() {
        let _ = self.val.small;
    }
}