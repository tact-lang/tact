struct SimpleInner { a: Int; b: Bool }

contract StructPersistenceTest {
    foo: SimpleInner = SimpleInner{a:1, b:true};

    receive() {}
}