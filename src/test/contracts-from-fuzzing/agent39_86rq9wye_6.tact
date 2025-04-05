trait MyTrait {
    const MY_TRAIT_CONSTANT: Int = 100;
}

contract TestTrait with MyTrait {
    receive() {
         // Correct reference to trait constant via self
         throwIf(101, self.MY_TRAIT_CONSTANT != 100);
    }
}
