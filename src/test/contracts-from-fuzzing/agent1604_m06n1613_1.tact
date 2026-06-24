struct Nested {
    level1: Bool;
    level2: Bool?;
    level3: Bool?;
}

contract NestedOptionalTest {
    data: Nested = Nested{
        level1: true,
        level2: null,
        level3: true
    };

    receive() {}
}