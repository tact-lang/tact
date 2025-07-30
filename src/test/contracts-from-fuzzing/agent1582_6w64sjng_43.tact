struct ConflictingNames {
    foo: Int;
    Foo: Int;
}

contract ConflictingNamesTest {
    x: ConflictingNames;
    init() {
        self.x=ConflictingNames{foo:1,Foo:2};
    }
}