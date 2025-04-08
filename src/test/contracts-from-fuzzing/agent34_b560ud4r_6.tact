struct Defaults {
    w: Int = 1;
    x: Bool = false;
    y: String = "abc";
    z: Address; // no default
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{
            z: myAddress(),
        };
    }
}