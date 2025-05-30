struct NumberTuple {
    val: Int;
    flag: Bool;
}

contract TupleStructTest {
    receive() {}

    // Correct tuple conversion: using a struct and optional return type as documented
    get fun get_tuple() : NumberTuple? {
        return NumberTuple{ val: 42, flag: true };
    }
}
