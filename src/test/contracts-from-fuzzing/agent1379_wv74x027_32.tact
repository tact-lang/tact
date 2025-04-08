trait T { val: Int }

contract WithTrait with T {
    val: Int;

    init() {
        self.val = 42;
    }
}
