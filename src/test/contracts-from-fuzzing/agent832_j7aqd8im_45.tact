struct DeepOptionLevel {
    a: Int?;
    b: Bool?;
}

trait OptDeepTrait {
    nested: DeepOptionLevel?;
}

contract TraitNestedOptional with OptDeepTrait {
    nested: DeepOptionLevel?;
    init() {
        self.nested = null;
    }
    receive() {
        if (self.nested != null) {
            let _ = self.nested!!;
        }
    }
}