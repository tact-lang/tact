trait SimpleTrait { val: Int }

contract TraitInheritanceTest with SimpleTrait {
    val: Int;

    init() {
        self.val = 123;
    }
}
