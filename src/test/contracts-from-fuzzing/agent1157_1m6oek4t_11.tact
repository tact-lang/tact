struct Leaf { val: Int; }
struct Branch { leaf: Leaf?; }
struct Root { branch: Branch?; }

contract OptNestedStructsTest {
    root: Root;

    init() {
        self.root = Root{ branch: null };
    }

    receive() {
        let tmp = self.root;
    }
}