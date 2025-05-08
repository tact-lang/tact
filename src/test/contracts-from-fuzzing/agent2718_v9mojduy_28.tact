trait ExampleTrait { a: Int }

contract ChildTrait with ExampleTrait {
    a: Int;

    init() {
        self.a = 5;
    }
}