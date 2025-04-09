struct Rec {
    a: Int;
}

contract OptFromNullInit {
    val: Rec?;

    init() {
        self.val = null;
    }
}