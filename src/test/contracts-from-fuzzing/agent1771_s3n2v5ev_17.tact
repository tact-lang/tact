trait ExampleTrait {
    someField: Int;
}

contract TraitFieldInherit with ExampleTrait {
    someField: Int;

    init() {
        self.someField = 42;
    }
}