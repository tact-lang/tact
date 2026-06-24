struct TestX { a: Int; }

contract FieldInitialized {
 state: TestX = TestX { a: 42 };
}