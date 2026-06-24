struct SparseDefaults {
    x: Int = 5;
    y: Bool;
    z: String = "hello";
    q: Address;
}

contract TestContract {
    val: SparseDefaults;

    init() {
        self.val = SparseDefaults{
            y: false,
            q: myAddress(),
        };
    }
}