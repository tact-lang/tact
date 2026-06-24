const val: Int = 10;

struct Inner { val: Int; }

contract TestContract {
    val: Int;

    init() {
        self.val = 1; // contract field
        let x = Inner{val: 2};
        require(val == 10, "global const");
    }

    receive() {}
}