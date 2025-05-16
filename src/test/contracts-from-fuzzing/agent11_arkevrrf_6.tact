/* Test 6: Getter returning a tuple via a struct with nested block return */
struct Tuple {
    a: Int;
    b: Int;
}
contract C2 {
    get fun getTuple(): Tuple {
        {
            return Tuple { a: 1, b: 2 };
        }
    }
}
