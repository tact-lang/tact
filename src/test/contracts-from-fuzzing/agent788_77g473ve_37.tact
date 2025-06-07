trait TAncestor { val: Int }

contract InheritCheck with TAncestor {
    val: Int;

    init() {
        self.val = 22;
    }
}
